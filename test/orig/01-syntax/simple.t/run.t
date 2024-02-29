Instrument with vlt.ppx:
  $ dune describe pp simple.ml 2> /dev/null | tail -n 52
  let () = Vlt.Logger.prepare "Simple"
  let main () =
    Vlt.Logger.log "Simple.main" Vlt.Level.TRACE ~file:"simple.ml" ~line:4
      ~column:2 ~properties:[] ~error:None "entering main";
    if (Array.length Sys.argv) = 0
    then
      (if Vlt.Logger.check_level "Simple.main" Vlt.Level.WARN
       then
         Vlt.Logger.log "Simple.main" Vlt.Level.WARN ~file:"simple.ml" ~line:6
           ~column:4 ~properties:[] ~error:None
           (Printf.sprintf "no %s" "argument")
       else ());
    for i = 1 to pred (Array.length Sys.argv) do
      (try
         if Vlt.Logger.check_level "Simple.main" Vlt.Level.DEBUG
         then
           Vlt.Logger.log "Simple.main" Vlt.Level.DEBUG ~file:"simple.ml"
             ~line:9 ~column:6 ~properties:[] ~error:None "getting variable "
         else ();
         print_endline (Sys.getenv (Sys.argv.(i)))
       with
       | Not_found ->
           if Vlt.Logger.check_level "Simple.main" Vlt.Level.ERROR
           then
             Vlt.Logger.log "Simple.main" Vlt.Level.ERROR ~file:"simple.ml"
               ~line:13 ~column:8
               ~properties:(let open Vlt in [("var", (Sys.argv.(i)))])
               ~error:None "undefined variable"
           else ())
    done;
    Vlt.Logger.log "Simple.main" Vlt.Level.TRACE ~file:"simple.ml" ~line:15
      ~column:2 ~properties:[] ~error:None "leaving main"
  let () =
    if Vlt.Logger.check_level "App" Vlt.Level.INFO
    then
      Vlt.Logger.log "App" Vlt.Level.INFO ~file:"simple.ml" ~line:18 ~column:2
        ~properties:[] ~error:None "start ..."
    else ();
    (try main ()
     with
     | e ->
         (if Vlt.Logger.check_level "Simple" Vlt.Level.FATAL
          then
            Vlt.Logger.log "Simple" Vlt.Level.FATAL ~file:"simple.ml" ~line:22
              ~column:4 ~properties:[] ~error:(Some e) "uncaught exception"
          else ();
          Printexc.print_backtrace stdout));
    if Vlt.Logger.check_level "App" Vlt.Level.INFO
    then
      Vlt.Logger.log "App" Vlt.Level.INFO ~file:"simple.ml" ~line:24 ~column:2
        ~properties:[] ~error:None "end ..."
    else ()
