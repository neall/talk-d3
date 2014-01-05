alicebob_data = 'people = [[1, "Alice"], [2, "Bob"]];'
alicebob_container = 'container = d3.select("#container");'
alicebob_selectall = 'links = container.selectAll("a").data(people);'
alicebob_enter =
  """
  links.enter().append("a")
    .attr("href", function(d){ return "/users/" + d[0] })
    .text(function(d){ return d[1] });
  """
alicebob_enter_no_text =
  """
  links.enter().append("a")
    .attr("href", function(d){ return "/users/" + d[0] });
  """
alicebob_exit = 'links.exit().remove();'
alicebob_update = 'links.text(function(d){ return d[1] });'
alicebob_selectall_w_id =
  """
  links = container.selectAll("a")
    .data(people, function(d){ return d[0] });
  """

alicebobd3 = [
  alicebob_data
  ' '
  alicebob_container
  ' '
  alicebob_selectall
  ' '
  alicebob_enter
].join("\n")

alicebobfull = [
  alicebob_data
  ' '
  alicebob_container
  ' '
  alicebob_selectall_w_id
  ' '
  alicebob_enter_no_text
  ' '
  alicebob_exit
  ' '
  alicebob_update
].join("\n")

codes =
  alicebob: '[[1, "Alice"], [2, "Bob"]]'
  alicebobjson: '[{id:1,name:"Alice"},{id:2,name:"Bob"}]'
  alicehtml: '<a href=/users/1>Alice</a>'
  bobhtml: '<a href=/users/2>Bob</a>'
  alicebob_data: alicebob_data
  alicebobd3: alicebobd3
  alicebobfull: alicebobfull
  alicebob_container: alicebob_container
  alicebob_selectall: alicebob_selectall
  alicebob_enter: alicebob_enter
  alicebob_exit: alicebob_exit
  alicebob_update: alicebob_update
  alicebob_selectall_w_id: alicebob_selectall_w_id
  d3callback: 
    """
    function(d, i) {
      // first argument is your datum
      // second argument is your index
      // `this` is the DOM element
    }
    """

timeline =
  javascript: '1995 JavaScript'
  jquery:     '2006 jQuery'
  fast:       '2008-2009 Fast JavaScript'
  hashchange: '2009-2010 Hashchange'
  pushstate:  '2010-2012 Pushstate'
  frameworks: 'today Frameworks'

frameworkstep =
  data:       'data'
  controller: 'controller'
  template:   'template'
  html:       'HTML'
  browser:    '(sent to browser)'
  document:   'document'
  xxx:        '????'
  transform:  'transformation'

d3js = 'D3.js'
ddd  = 'Data Driven Documents'
asa  = 'as a'
csf  = 'Client-Side Framework'
spa  = 'the "single-page web app"'
dataxf = 'data transformation'

window.classesToApply =
  toplevel: [d3js, ddd]
  secondlevel: [
    asa
    csf
    spa
    '='
    timeline.javascript
    timeline.jquery
    timeline.fast
    timeline.hashchange
    timeline.pushstate
    timeline.frameworks
  ]
  code: _(codes).values()

welcomeSlide =
  slides: [
    d3js
    asa
    csf
    ' '
    'Neal Lindsay'
    '@neall'
  ]
  ratio: [5, 2, 3, 2, 2, 2]

howDidWeGetHere = ["today's client-side web", 'how did we get here?']

aboutD3 = [
  d3js
  'Mike Bostock'
  'at The New York Times'
]
award = [
  d3js
  'won the:'
  '2013 Gannett Technical Innovation'
  'in the service of journalism award'
]
moreImportant = [
  d3js
  'more importantly:'
  'is totally awesome'
]
definitionSlide = [
  d3js
  '='
  ddd
]

window.slides = [
  welcomeSlide
  howDidWeGetHere
  timeline.javascript
  [timeline.javascript, 'Netscape 2', 'IE 3']
  [timeline.javascript, 'chaos reigns', 'for a decade']
  timeline.jquery
  [timeline.jquery, 'IE 6', 'Firefox 1.5', 'Safari 2']
  [timeline.jquery, 'DOM manipulation', 'event sanity']
  timeline.fast
  [
    timeline.fast
    'Chrome 1.0 (2008)'
    'Safari 4 (2008)'
    'Firefox 3.5 (2009)'
    'IE 9 (2009)'
  ]
  [
    timeline.fast
    'way more DOM manipulation'
  ]
  [timeline.hashchange, timeline.pushstate]
  [
    timeline.hashchange
    timeline.pushstate
    'IE 9 (2009), IE 10 (2012)'
    'Firefox 3.6 (2010), Firefox 4 (2011)'
    'Chrome 5 (2010)'
    'Safari 5 (2010)'
  ]
  [
    timeline.hashchange
    timeline.pushstate
    'enable development of'
    'pages that are both'
    'linkable and long-lived'
  ]
  spa
  timeline.frameworks
  [
    timeline.frameworks
    'Angular (2009)'
    'Backbone (2010)'
    'Knockout (2010)'
    'Sproutcore (2010)'
    'Ember (2011)'
  ]
  [
    timeline.frameworks
    'more or less mirroring'
    'server-side frameworks'
  ]
  [
    frameworkstep.data
    frameworkstep.controller
    frameworkstep.template
    frameworkstep.html
    frameworkstep.browser
    frameworkstep.document
  ]
  [
    frameworkstep.data
    frameworkstep.browser
    frameworkstep.controller
    frameworkstep.template
    frameworkstep.html
    frameworkstep.document
  ]
  [
    frameworkstep.data
    frameworkstep.browser
    frameworkstep.xxx
    frameworkstep.document
  ]
  [
    frameworkstep.data
    frameworkstep.browser
    frameworkstep.transform
    frameworkstep.document
  ]
  [
    frameworkstep.data
    frameworkstep.browser
    d3js
    frameworkstep.document
  ]

  aboutD3
  award
  moreImportant
  '(show examples)'
  definitionSlide
  [
    d3js
    '='
    ddd
    'really means it'
  ]
  [
    d3js
    'transforms your data'
    'into a document'
  ]

  dataxf
  [
    ' '
    dataxf
    '  '
    codes.alicebob
    '   '
    codes.alicebobjson
    '    '
  ]
  [
    ' '
    dataxf
    '  '
    codes.alicebob
    '   '
    codes.alicehtml
    codes.bobhtml
    '    '
  ]
  'Actual Code Using D3'
  codes.alicebobd3
  codes.alicebob_container
  codes.alicebob_selectall
  codes.alicebob_enter
  codes.d3callback
  [
    'enter'
    'exit'
    'update'
  ]
  {
    slides: [
      'enter'
      codes.alicebob_enter
    ]
    ratio: [1,3]
  }
  {
    slides: [
      'exit'
      codes.alicebob_exit
    ]
    ratio: [1,3]
  }
  'update'
  {
    slides: [
      'update'
      codes.alicebob_update
    ]
    ratio: [1,3]
  }
  [
    'but which is which?'
    'id function'
  ]
  [
    'id function'
    codes.alicebob_selectall
  ]
  [
    'id function'
    codes.alicebob_selectall_w_id
  ]
  'all together:'
  codes.alicebobfull
  'That is 90% of D3'

  'as a Framework'

  'live(-ish) coding'

  [
    'further information'
    'd3js.org'
    'dashingd3js.org'
    'MDN'
  ]
  'thank you'
  {
    slides: [
      'd3js.org'
      'dashingd3js.org'
      'MDN'
      ' '
      'questions?'
    ]
    ratio: [2,2,2,1,4]
  }
]
