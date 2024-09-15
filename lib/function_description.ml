open Ctypes
module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  let get_version = foreign "tdl_get_version" (void @-> returning int)
end
