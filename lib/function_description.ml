open Ctypes
module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  let get_version = foreign "tdl_get_version" (void @-> returning int)
  let canvas = foreign "tdl_canvas" (void @-> returning (ptr Types.Canvas.t))

  let destroy_canvas =
    foreign "tdl_destroy_canvas" (ptr Types.Canvas.t @-> returning void)

  let u8string = foreign "u8string" (string @-> returning Types.U8string.t)

  let style =
    foreign "tdl_style"
      (Types.Style.Point_color.t @-> int @-> returning Types.Style.t)

  let text =
    foreign "tdl_text"
      (Types.U8string.t @-> Types.Style.t @-> returning Types.Text.t)

  let print =
    foreign "tdl_print" (ptr Types.Canvas.t @-> Types.Text.t @-> returning bool)

  let display = foreign "tdl_display" (ptr Types.Canvas.t @-> returning void)
  let point = foreign "tdl_point" (int @-> int @-> returning Types.Point.t)

  let set_cursor_pos =
    foreign "tdl_set_cursor_pos"
      (ptr Types.Canvas.t @-> Types.Point.t @-> returning void)
end
