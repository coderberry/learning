This quiz is to write a program that displays LCD-style numbers at adjustable sizes.

The digits to be displayed will be passed as an argument to the program. Size should be controlled with the command-line option -s followed by a positive integer. The default value for -s is 2.

For example, if your program is called with this:

    $ lcd.rb 012345 
  
the correct display is this:

     --        --   --        --
    |  |    |    |    | |  | |
    |  |    |    |    | |  | |
               --   --   --   --
    |  |    | |       |    |    |
    |  |    | |       |    |    |
     --        --   --        --

And for this:

    > lcd.rb -s 1 6789

your program should print this:

    ---- |- | |-| |-|
    |-| ||-|-|

Note the single column of space between digits in both examples. For other values of -s, simply lengthen the - and | bars.