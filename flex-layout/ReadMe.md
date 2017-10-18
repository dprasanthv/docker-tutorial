flex-layout-documentation

Cheatsheets for Flex-Layout

fxLayout: row, column (break the element into row, column) [fxLayout]="direction"

  *   fxFlex (breaking the inner element into 100 parts, pixels)
  
  *   [fxFlex.md]="box1Width" specific class
  
  * fxShow, fxHide directives [fxShow], [fxHide] with below mediaQuery
Breakpoint	mediaQuery

xs	'screen and (max-width: 599px)'
sm	'screen and (min-width: 600px) and (max-width: 959px)'
md	'screen and (min-width: 960px) and (max-width: 1279px)'
lg	'screen and (min-width: 1280px) and (max-width: 1919px)'
xl	'screen and (min-width: 1920px) and (max-width: 5000px)'
lt-sm	'screen and (max-width: 599px)'
lt-md	'screen and (max-width: 959px)'
lt-lg	'screen and (max-width: 1279px)'
lt-xl	'screen and (max-width: 1919px)'
gt-xs	'screen and (min-width: 600px)'
gt-sm	'screen and (min-width: 960px)'
gt-md	'screen and (min-width: 1280px)'
gt-lg	'screen and (min-width: 1920px)'


fxLayoutAlign="start" start end middle
