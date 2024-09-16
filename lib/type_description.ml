open Ctypes

module Types (F : Ctypes.TYPE) = struct
  type canvas
  and text
  and style
  and u8string
  and point_color

  let canvas : canvas structure typ = structure "tdl_canvas"
  let style : style structure typ = structure "tdl_style"

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
end
