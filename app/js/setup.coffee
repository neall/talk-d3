body = d3.select('body')
svg = body.append('svg')

slideIndex = 0
getSlideIndex = -> parseInt(window.location.hash.slice(1), 10) || 0
setSlideIndex = -> window.location.hash = "##{slideIndex}"

svgWidth  = -> svg[0][0].clientWidth
svgHeight = -> svg[0][0].clientHeight

svgBBox = ->
  fullWidth  = svgWidth()
  fullHeight = svgHeight()
  width:  fullWidth * 0.9
  height: fullHeight * 0.9
  x:      fullWidth * 0.05
  y:      fullHeight * 0.05

normalizeSize = (slide, boundingBox = svgBBox()) ->
  box = slide.getBBox()
  scaleFactor = _([boundingBox.width / box.width, boundingBox.height / box.height]).min()
  xCorrection = -((box.width  / 2) + box.x)
  yCorrection = -((box.height / 2) + box.y)
  xCentering = boundingBox.x + boundingBox.width / 2
  yCentering = boundingBox.y + boundingBox.height / 2
  "translate(#{xCentering}, #{yCentering}) scale(#{scaleFactor}) translate(#{xCorrection}, #{yCorrection})"

currSlideTransform = (data, svgBoxes = []) -> (d, i) -> normalizeSize(@, svgBoxes[i])

nextSlideTransform = ->
  "translate(#{svgWidth()},#{3 * svgHeight()}) #{normalizeSize(@)}"

populateSlides = (slides) ->
  slides.each (d) ->
    slide = d3.select(@)
    lines = d.split(/\n/)
    if lines.length > 1
      height = lines.length * 15
      width = _(lines).chain().map((l)->l.length).max().value() * 8
      lineDivs = slide
        .append('foreignObject').attr('width', width).attr('height', height)
        .append('xhtml:body')
        .append('pre').selectAll('div').data(lines)
      lineDivs.enter().append('div')
      lineDivs.exit().remove()
      lineDivs.text((d2)->d2 || ' ')
    else
      slide.append('text').text(d)

slideId = (d)-> d.id || d

classListReduction = (d) -> (memo, idList, className) ->
  memo.push(className) if _(idList).contains(slideId(d))
  memo
slideClasses = (d) ->
  classList = _(window.classesToApply).reduce(classListReduction(d), [])
  classList.push('slide')
  classList.join(' ')

displayCurrentSlides = ->
  length = window.slides.length
  slideIndex = 0 if slideIndex >= length
  slideIndex = length - 1 if slideIndex < 0
  setSlideIndex()
  currentSlideData =
    _([window.slides[slideIndex]?.slides || [window.slides[slideIndex]]]).flatten()
  slides = svg.selectAll('g.slide').data(currentSlideData, slideId)
  slides.enter().append('g')
    .attr('class', slideClasses)
    .call(populateSlides)
    .attr('transform', nextSlideTransform)
  slides.exit().transition()
    .attr('transform', nextSlideTransform)
    .remove()
  slideRatio = _(currentSlideData).map (d,i) ->
    window.slides[slideIndex]?.ratio?[i] || 1
  slideRatioSum = _(slideRatio).reduce (memo, d) -> memo + d
  soFar = 0
  slideBoxes = _(slideRatio).map (d) ->
    bBox = svgBBox()
    height = bBox.height * d / slideRatioSum
    box =
      width:  bBox.width
      height: height
      x:      bBox.x
      y:      bBox.y + soFar
    soFar += height
    box
  slides.transition()
    .attr('transform', currSlideTransform(currentSlideData, slideBoxes))

body.on 'keyup', ->
  switch d3.event.which
    when 34
      slideIndex += 1
      displayCurrentSlides()
    when 33
      slideIndex -= 1
      displayCurrentSlides()

slideIndex = getSlideIndex()
displayCurrentSlides()
