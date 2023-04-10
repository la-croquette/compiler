
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SWAP
    | SUB
    | REM
    | PUSH
    | POP
    | MUL
    | INT of (
# 13 "pfx/basic/parser.mly"
       (int)
# 21 "pfx/basic/parser.ml"
  )
    | EOF
    | DIV
    | ADD
  
end

include MenhirBasics

# 1 "pfx/basic/parser.mly"
  
  (* Ocaml code here*)
  open Ast

# 36 "pfx/basic/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s _menhir_cell0_INT, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : INT.
        Start symbol: program. *)

  | MenhirState02 : (('s, _menhir_box_program) _menhir_cell1_SWAP, _menhir_box_program) _menhir_state
    (** State 02.
        Stack shape : SWAP.
        Start symbol: program. *)

  | MenhirState03 : (('s, _menhir_box_program) _menhir_cell1_SUB, _menhir_box_program) _menhir_state
    (** State 03.
        Stack shape : SUB.
        Start symbol: program. *)

  | MenhirState04 : (('s, _menhir_box_program) _menhir_cell1_REM, _menhir_box_program) _menhir_state
    (** State 04.
        Stack shape : REM.
        Start symbol: program. *)

  | MenhirState06 : (('s, _menhir_box_program) _menhir_cell1_PUSH _menhir_cell0_INT, _menhir_box_program) _menhir_state
    (** State 06.
        Stack shape : PUSH INT.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_POP, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : POP.
        Start symbol: program. *)

  | MenhirState08 : (('s, _menhir_box_program) _menhir_cell1_MUL, _menhir_box_program) _menhir_state
    (** State 08.
        Stack shape : MUL.
        Start symbol: program. *)

  | MenhirState09 : (('s, _menhir_box_program) _menhir_cell1_DIV, _menhir_box_program) _menhir_state
    (** State 09.
        Stack shape : DIV.
        Start symbol: program. *)

  | MenhirState10 : (('s, _menhir_box_program) _menhir_cell1_ADD, _menhir_box_program) _menhir_state
    (** State 10.
        Stack shape : ADD.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_ADD = 
  | MenhirCell1_ADD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DIV = 
  | MenhirCell1_DIV of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_INT = 
  | MenhirCell0_INT of 's * (
# 13 "pfx/basic/parser.mly"
       (int)
# 95 "pfx/basic/parser.ml"
)

and ('s, 'r) _menhir_cell1_MUL = 
  | MenhirCell1_MUL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_POP = 
  | MenhirCell1_POP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PUSH = 
  | MenhirCell1_PUSH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REM = 
  | MenhirCell1_REM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SUB = 
  | MenhirCell1_SUB of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SWAP = 
  | MenhirCell1_SWAP of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun e i ->
    (
# 37 "pfx/basic/parser.mly"
                        (Push::Num i::e)
# 124 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_02 =
  fun e ->
    (
# 38 "pfx/basic/parser.mly"
                  (Pop::e )
# 132 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_03 =
  fun e ->
    (
# 39 "pfx/basic/parser.mly"
                  (Swap::e)
# 140 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_04 =
  fun e ->
    (
# 40 "pfx/basic/parser.mly"
                  (Add::e )
# 148 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_05 =
  fun e ->
    (
# 41 "pfx/basic/parser.mly"
                  (Div::e )
# 156 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_06 =
  fun e ->
    (
# 42 "pfx/basic/parser.mly"
                  (Mul::e )
# 164 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_07 =
  fun e ->
    (
# 43 "pfx/basic/parser.mly"
                  (Rem::e )
# 172 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_08 =
  fun e ->
    (
# 44 "pfx/basic/parser.mly"
                  (Sub::e )
# 180 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_09 =
  fun i ->
    (
# 47 "pfx/basic/parser.mly"
               (Push::Num i::[])
# 188 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_10 =
  fun () ->
    (
# 48 "pfx/basic/parser.mly"
         (Pop::[] )
# 196 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_11 =
  fun () ->
    (
# 49 "pfx/basic/parser.mly"
         (Swap::[])
# 204 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_12 =
  fun () ->
    (
# 50 "pfx/basic/parser.mly"
         (Add::[] )
# 212 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_13 =
  fun () ->
    (
# 51 "pfx/basic/parser.mly"
         (Div::[] )
# 220 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_14 =
  fun () ->
    (
# 52 "pfx/basic/parser.mly"
         (Mul::[] )
# 228 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_15 =
  fun () ->
    (
# 53 "pfx/basic/parser.mly"
         (Rem::[] )
# 236 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_16 =
  fun () ->
    (
# 54 "pfx/basic/parser.mly"
         (Sub::[] )
# 244 "pfx/basic/parser.ml"
     : (Ast.command list))

let _menhir_action_17 =
  fun e i ->
    (
# 33 "pfx/basic/parser.mly"
                      ( i, e )
# 252 "pfx/basic/parser.ml"
     : (Ast.program))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | DIV ->
        "DIV"
    | EOF ->
        "EOF"
    | INT _ ->
        "INT"
    | MUL ->
        "MUL"
    | POP ->
        "POP"
    | PUSH ->
        "PUSH"
    | REM ->
        "REM"
    | SUB ->
        "SUB"
    | SWAP ->
        "SWAP"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_19 : type  ttv_stack. ttv_stack _menhir_cell0_INT -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell0_INT (_menhir_stack, i) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_17 e i in
      MenhirBox_program _v
  
  let rec _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_19 _menhir_stack _v
      | MenhirState02 ->
          _menhir_run_18 _menhir_stack _v
      | MenhirState03 ->
          _menhir_run_17 _menhir_stack _v
      | MenhirState04 ->
          _menhir_run_16 _menhir_stack _v
      | MenhirState06 ->
          _menhir_run_15 _menhir_stack _v
      | MenhirState07 ->
          _menhir_run_14 _menhir_stack _v
      | MenhirState08 ->
          _menhir_run_13 _menhir_stack _v
      | MenhirState09 ->
          _menhir_run_12 _menhir_stack _v
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _v
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_SWAP -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_SWAP (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_03 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_SUB -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_SUB (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_08 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_REM -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_REM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_07 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PUSH _menhir_cell0_INT -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell0_INT (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_PUSH (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_01 e i in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_14 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_POP -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_POP (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_02 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_MUL -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_MUL (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_06 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_DIV -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_DIV (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_05 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_ADD -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_ADD (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_04 e in
      _menhir_goto_expr _menhir_stack _v _menhir_s
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | SUB ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | REM ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | PUSH ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | POP ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | MUL ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | DIV ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | ADD ->
          let _menhir_stack = MenhirCell1_SWAP (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | EOF ->
          let _v = _menhir_action_11 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | SUB ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | REM ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | PUSH ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | POP ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | MUL ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | DIV ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | ADD ->
          let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | EOF ->
          let _v = _menhir_action_16 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | SUB ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | REM ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | PUSH ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | POP ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | MUL ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | DIV ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | ADD ->
          let _menhir_stack = MenhirCell1_REM (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | EOF ->
          let _v = _menhir_action_15 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SWAP ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | SUB ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | REM ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | PUSH ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | POP ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | MUL ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | DIV ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | ADD ->
              let _menhir_stack = MenhirCell1_PUSH (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
          | EOF ->
              let i = _v in
              let _v = _menhir_action_09 i in
              _menhir_goto_expr _menhir_stack _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | SUB ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | REM ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PUSH ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | POP ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | MUL ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | DIV ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | ADD ->
          let _menhir_stack = MenhirCell1_POP (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | EOF ->
          let _v = _menhir_action_10 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | SUB ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | REM ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | PUSH ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | POP ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | MUL ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | DIV ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | ADD ->
          let _menhir_stack = MenhirCell1_MUL (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | EOF ->
          let _v = _menhir_action_14 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | SUB ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | REM ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | PUSH ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | POP ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | MUL ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | DIV ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | ADD ->
          let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | EOF ->
          let _v = _menhir_action_13 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SWAP ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | SUB ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | REM ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | PUSH ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | POP ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | MUL ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | DIV ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | ADD ->
          let _menhir_stack = MenhirCell1_ADD (_menhir_stack, _menhir_s) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | EOF ->
          let _v = _menhir_action_12 () in
          _menhir_goto_expr _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SWAP ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | SUB ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | REM ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | PUSH ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | POP ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | MUL ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | DIV ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | ADD ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 58 "pfx/basic/parser.mly"
    
# 699 "pfx/basic/parser.ml"
