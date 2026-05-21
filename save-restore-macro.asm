***********************************************************************
*  SAVE / RESTORE MACRO EXAMPLE
*  Demonstrates standard OS/390 save area chaining
***********************************************************************
SAVE_RESTORE    CSECT
SAVE_RESTORE    AMODE 31
SAVE_RESTORE    RMODE ANY

         STM   R14,R12,12(R13)        Save caller registers
         LR    R12,R15                Establish base register
         USING SAVE_RESTORE,R12

*----------------------------------------------------------------------
* Create new save area and chain it
*----------------------------------------------------------------------
         LA    R11,SAVEAREA           Address of new save area
         ST    R13,4(R11)             Backward chain
         ST    R11,8(R13)             Forward chain
         LR    R13,R11                Switch to new save area

*----------------------------------------------------------------------
* Do some work here
*----------------------------------------------------------------------
         LHI   R6,42                  Example operation
         ST    R6,RESULT              Store result

*----------------------------------------------------------------------
* Restore save area chain
*----------------------------------------------------------------------
         L     R13,4(R13)             Restore previous save area
         LM    R14,R12,12(R13)        Restore registers
         BR    R14                    Return

SAVEAREA DS    18F
RESULT   DS    F

         END   SAVE_RESTORE
