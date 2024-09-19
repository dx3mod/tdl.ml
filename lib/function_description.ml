open Ctypes
module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  (* Display *)

  let display = foreign "tdl_display" (ptr Types.Canvas.t @-> returning void)

  (* Terminal *)

  let terminal_clear = foreign "tdl_terminal_clear" (void @-> returning void)

  let terminal_set_alternate_screen =
    foreign "tdl_terminal_set_alternate_screen" (bool @-> returning void)

  let terminal_set_cursor =
    foreign "tdl_terminal_set_cursor" (bool @-> returning void)

  (* Geometry *)

  let point = foreign "tdl_point" (int @-> int @-> returning Types.Point.t)
  let size = foreign "tdl_size" (int @-> int @-> returning Types.Size.t)

  let line =
    foreign "tdl_line"
      (Types.Point.t @-> Types.Point.t @-> returning Types.Line.t)

  let rectangle =
    foreign "tdl_rectangle"
      (Types.Point.t @-> Types.Size.t @-> returning Types.Rectangle.t)

  (* Canvas *)

  let canvas = foreign "tdl_canvas" (void @-> returning (ptr Types.Canvas.t))

  let destroy_canvas =
    foreign "tdl_destroy_canvas" (ptr Types.Canvas.t @-> returning void)

  let set_cursor_pos =
    foreign "tdl_set_cursor_pos"
      (ptr Types.Canvas.t @-> Types.Point.t @-> returning void)

  let print =
    foreign "tdl_print" (ptr Types.Canvas.t @-> Types.Text.t @-> returning bool)

  (* UTF8 string *)

  let u8string = foreign "u8string" (string @-> returning Types.U8string.t)

  let style =
    foreign "tdl_style"
      (Types.Style.Point_color.t @-> int @-> returning Types.Style.t)

  (* Text and styles *)

  let text =
    foreign "tdl_text"
      (Types.U8string.t @-> Types.Style.t @-> returning Types.Text.t)

  (* Common *)

  let get_version = foreign "tdl_get_version" (void @-> returning int)
end
