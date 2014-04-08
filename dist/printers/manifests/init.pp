# Defines a seperate class for printers, to keep nodes.pp clean
class printers {

  $normalprinters = [
  'cramer114',
  'fidel130',
  'fidel130-color',
  'library22',
  'library122',
  'library208',
  'library208-color',
  'msec187',
  'south218',
  'speare4a',
  'speare4b',
  'speare5',
  'speare5-color',
  'speare16',
  'speare23a',
  'speare23b',
  'speare23-color',
  'speare116',
  'speare117',
  'speare142',
  'speare146',
  'transparency',
  'torres125',
  'weir128',
  'weir209',
  ]

  printers::printer { $normalprinters : }#  ->

}
