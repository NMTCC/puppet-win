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
  'presidents113',
  'south218',
  'speare4a',
  'speare4b',
  'speare5',
  'speare5-color',
  'speare16',
  'speare23a',
  'speare23b',
  'speare23-color',
  'speare112',
  'speare116',
  'speare117',
  'speare142',
  'torres130',
  'transparency',
  'weir128',
  'weir209',
  'west219',
  ]

  printers::printer { $normalprinters : }#  ->

}
