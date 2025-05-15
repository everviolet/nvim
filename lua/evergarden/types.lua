---@module 'evergarden.types'

---@alias evergarden.types.variant 'winter'|'fall'|'spring'|'summer'

---@alias evergarden.types.colors.enum 'crust'|'softbase'|'mantle'|'base'|'surface0'|'surface1'|'surface2'|'overlay0'|'overlay1'|'overlay2'|'subtext0'|'subtext1'|'text'|'red'|'orange'|'yellow'|'lime'|'green'|'aqua'|'snow'|'blue'|'skye'|'purple'|'pink'|'cherry'
---@alias evergarden.types.colors { [evergarden.types.colors.enum]: string }

---@class evergarden.types.colorspec
---@field fg? string
---@field bg? string
---@field link? string
---@field blend? integer
---@field style? evergarden.types.styleopt
---@field [1]? string
---@field [2]? string

---@alias evergarden.types.styleopt evergarden.types.styleopt.enum[]
---@alias evergarden.types.styleopt.enum 'bold'|'standout'|'underline'|'undercurl'|'underdouble'|'underdotted'|'underdashed'|'strikethrough'|'italic'|'reverse'|'nocombine'

---@alias evergarden.types.hlgroups { [string]: evergarden.types.colorspec }
---@alias evergarden.types.hlgroups.OL { [integer]: evergarden.types.hlgroups.OL, [string]: evergarden.types.colorspec }
