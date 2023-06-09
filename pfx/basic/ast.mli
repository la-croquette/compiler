(* The type of the commands for the stack machine ,
Ce sont les noms que j'ai défini pour les command*)
type command =
|Push 
|Pop
|Swap
|Add 
|Div
|Mul
|Rem
|Sub 
|Num of int;;

(* The type for programs *)
type program = int * command list

(* Converting a command to a string for printing *)
val string_of_command : command -> string

(* Converting a program to a string for printing *)
val string_of_program : program -> string
