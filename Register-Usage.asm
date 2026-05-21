***********************************************************************
*  REGISTER USAGE EXAMPLE
*  Demonstrates general register conventions in 31-bit addressing mode
***********************************************************************
REGISTER_USAGE   CSECT
REGISTER_USAGE   AMODE 31
REGISTER_USAGE   RMODE ANY

         STM   R14,R12,12(R13)        Save caller registers
         LR    R12,R15                Establish base register
         USING REGISTER_USAGE,R12

*----------------------------------------------------------------------
* Load immediate values into registers
*----------------------------------------------------------------------
         LHI   R3,100                 Load halfword immediate
         L     R4,VALUE1              Load fullword from storage
         LA    R5,WORKAREA            Load address of work area

*----------------------------------------------------------------------
* Simple arithmetic
*----------------------------------------------------------------------
         AR    R3,R4                  Add R4 to R3
         SR    R3,R5                  Subtract R5 from R3

*----------------------------------------------------------------------
* Return to caller
*----------------------------------------------------------------------
         LM    R14,R12,12(R13)        Restore registers
         BR    R14                    Return

VALUE1   DC    F'256'
WORKAREA DS    0F

         END   REGISTER_USAGE
