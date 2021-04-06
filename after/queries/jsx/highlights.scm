(jsx_element
  open_tag: (jsx_opening_element
    attribute: (jsx_attribute
    (property_identifier) @jsx.prop)))

(jsx_self_closing_element
  attribute: (jsx_attribute
    (property_identifier) @jsx.prop))

(jsx_opening_element ((identifier) @jsx.element
 (#match? @jsx.element "^[A-Z]")))

(jsx_closing_element ((identifier) @jsx.element
 (#match? @jsx.element "^[A-Z]")))

(jsx_self_closing_element ((identifier) @jsx.element
 (#match? @jsx.element "^[A-Z]")))

(variable_declarator ((identifier) @variable
 (#match? @variable "^[A-Z]")))

