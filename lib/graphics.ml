(** Graphics-like module for easy to use TDL. *)

let point_color bg fg =
  let point = Ctypes.make Bindings.Style.Point_color.t in
  Ctypes.setf point Bindings.Style.Point_color.bg (Unsigned.UInt.of_int bg);
  Ctypes.setf point Bindings.Style.Point_color.fg (Unsigned.UInt.of_int fg);
  point

let style point_color = Bindings.style point_color 0
let default_style = style (point_color 256 256)

let text ?style text =
  Bindings.text (Bindings.u8string text)
    (Option.value ~default:default_style style)

let version = Bindings.get_version ()

module Open_graph () = struct
  let canva = Bindings.canvas ()
  let close () = Bindings.destroy_canvas canva
  let display () = Bindings.display canva

  let with_display f =
    f ();
    display ()

  let print text = Bindings.print canva text |> ignore
end
