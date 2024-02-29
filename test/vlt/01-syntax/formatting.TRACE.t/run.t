Instrument with vlt.ppx:
  $ dune describe pp formatting.ml 2> /dev/null | tail -n 69
  let () = Vlt.Logger.prepare "Formatting"
  let () =
    if Vlt.Logger.check_level "Formatting" Vlt.Level.FATAL
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.FATAL ~file:"formatting.ml"
        ~line:4 ~column:2 ~properties:[] ~error:None "no parameter"
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.INFO
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.INFO ~file:"formatting.ml" ~line:5
        ~column:2 ~properties:[] ~error:None "one parameter: %d" 1
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.ERROR
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.ERROR ~file:"formatting.ml"
        ~line:6 ~column:2 ~properties:[] ~error:None "two parameters: %d %s" 1
        "abc"
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.DEBUG
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.DEBUG ~file:"formatting.ml"
        ~line:7 ~column:2 ~properties:[] ~error:None
        "three parameters: %d %s %f" 1 "abc" 3.
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.WARN
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.WARN ~file:"formatting.ml" ~line:8
        ~column:2 ~properties:[] ~error:None "four parameters: %d %s %f %B" 1
        "abc" 3. true
    else ();
    Vlt.Logger.logf "Formatting" Vlt.Level.TRACE ~file:"formatting.ml" ~line:9
      ~column:2 ~properties:[] ~error:None "five parameters: %d %s %f %B %c" 1
      "abc" 3. true 'x';
    ()
  let id x = x
  let () =
    if Vlt.Logger.check_level "Formatting" Vlt.Level.FATAL
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.FATAL ~file:"formatting.ml"
        ~line:15 ~column:2 ~properties:[] ~error:None "no parameter"
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.INFO
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.INFO ~file:"formatting.ml"
        ~line:16 ~column:2 ~properties:[] ~error:None "one parameter: %d"
        (id 1)
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.ERROR
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.ERROR ~file:"formatting.ml"
        ~line:17 ~column:2 ~properties:[] ~error:None "two parameters: %d %s" 1
        (id "abc")
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.DEBUG
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.DEBUG ~file:"formatting.ml"
        ~line:18 ~column:2 ~properties:[] ~error:None
        "three parameters: %d %s %f" 1 "abc" (id 3.)
    else ();
    if Vlt.Logger.check_level "Formatting" Vlt.Level.WARN
    then
      Vlt.Logger.logf "Formatting" Vlt.Level.WARN ~file:"formatting.ml"
        ~line:19 ~column:2 ~properties:[] ~error:None
        "four parameters: %d %s %f %B" 1 "abc" 3. (id true)
    else ();
    Vlt.Logger.logf "Formatting" Vlt.Level.TRACE ~file:"formatting.ml" ~line:20
      ~column:2 ~properties:[] ~error:None "five parameters: %d %s %f %B %c" 1
      "abc" 3. true (id 'x');
    ()

