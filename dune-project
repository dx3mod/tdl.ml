(lang dune 3.16)

(using ctypes 0.3)

(name tdl)

(generate_opam_files true)

(source
 (github dx3mod/tdl.ml))

(authors "Mikhail Lopatin <dx3mod@bk.ru>")

(maintainers "Mikhail Lopatin <dx3mod@bk.ru>")

(license MIT)

(package
 (name tdl)
 (synopsis "Bindings for TDL library")
 (description "Bindings for Text Drawing Library (terminal graphics)")
 (depends
  ocaml
  dune
  (ctypes :build))
 (allow_empty)
 (tags
  (tdl tty)))
