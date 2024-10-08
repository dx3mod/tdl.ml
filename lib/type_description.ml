open Ctypes

module Types (F : Ctypes.TYPE) = struct
  type canvas
  and text
  and style
  and u8string
  and point_color
  and point

  (* let canvas : canvas structure typ = structure "tdl_canvas" *)

  module U8string = struct
    let t : u8string structure typ = structure "u8string"
    let string = field t "string" (ptr char)
    let length = field t "length" int
    let () = seal t
  end

  module Style = struct
    let t : style structure typ = structure "tdl_style"

    module Point_color = struct
      let color = uint
      let t : point_color structure typ = structure "tdl_point_color"
      let bg = field t "bg" color
      let fg = field t "fg" color
      let () = seal t
    end

    module Attrs = struct
      let no = 0
      let bold = 1
      let italic = 1 lsl 1
      let underline = 1 lsl 2
      let crossed_out = 1 lsl 3
      let dim = 1 lsl 4
    end

    let attributes = field t "attributes" int
    let color = field t "color" Point_color.t
    let () = seal t
  end

  module Text = struct
    let t : text structure typ = structure "tdl_text"
    let string = field t "string" U8string.t
    let style = field t "style" Style.t
    let () = seal t
  end

  module Point = struct
    let t : point structure typ = structure "tdl_point"
    let x = field t "x" int
    let y = field t "y" int
    let () = seal t
  end

  module Size = struct
    let t : point structure typ = structure "tdl_size"
    let width = field t "width" int
    let height = field t "height" int
    let () = seal t
  end

  module Line = struct
    let t : point structure typ = structure "tdl_line"
    let a = field t "a" Point.t
    let b = field t "b" Point.t
    let () = seal t
  end

  module Rectangle = struct
    let t : point structure typ = structure "tdl_rectangle"
    let point = field t "point" Point.t
    let size = field t "size" Size.t
    let () = seal t
  end

  module Canvas = struct
    let t : canvas structure typ = structure "tdl_canvas"
    let cursor = field t "cursor" Point.t
    let () = seal t
  end

  let u8char = array 5 char

  module Buffer_point = struct
    let t : point structure typ = structure "tdl_buffer_point"
    let character = field t "character" u8char
    let style = field t "style" Style.t
    let () = seal t
  end
end
