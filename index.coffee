root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'mono-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'mono-ui.tabSizing', (value) ->
      setTabSizing(value)

    atom.config.observe 'mono-ui.hideDockButtons', (value) ->
      setHideDockButtons(value)

    atom.config.observe 'mono-ui.hideTreeViewTabs', (value) ->
      setHideTreeViewTabs(value)

    atom.config.observe 'mono-ui.hideTooltips', (value) ->
      setHideTooltips(value)

    # DEPRECATED: This can be removed at some point (added in Atom 1.17/1.18ish)
    # It removes `layoutMode`
    if atom.config.get('mono-ui.layoutMode')
      atom.config.unset('mono-ui.layoutMode')

  deactivate: ->
    unsetFontSize()
    unsetTabSizing()
    unsetHideTreeViewTabs()
    unsetHideTreeViewTabs()
    unsetHideTooltips()


# Font Size -----------------------

setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''


# Tab Sizing -----------------------

setTabSizing = (tabSizing) ->
  root.setAttribute('theme-mono-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-mono-ui-tabsizing')


# Dock Buttons -----------------------

setHideDockButtons = (hideDockButtons) ->
  if hideDockButtons
    root.setAttribute('theme-mono-ui-dock-buttons', 'hidden')
  else
    unsetHideDockButtons()

unsetHideDockButtons = ->
  root.removeAttribute('theme-mono-ui-dock-buttons')


# Tree View Tabs -----------------------

setHideTreeViewTabs = (hideTreeViewTabs) ->
  if hideTreeViewTabs
    root.setAttribute('theme-mono-ui-tree-view-tabs', 'hidden')
  else
    unsetHideTreeViewTabs()

unsetHideTreeViewTabs = ->
  root.removeAttribute('theme-mono-ui-tree-view-tabs')


# Tree View Tabs -----------------------

setHideTooltips = (hideTooltips) ->
  if hideTooltips
    root.setAttribute('theme-mono-ui-tooltips', 'hidden')
  else
    unsetHideTooltips()

unsetHideTooltips = ->
  root.removeAttribute('theme-mono-ui-tooltips')
