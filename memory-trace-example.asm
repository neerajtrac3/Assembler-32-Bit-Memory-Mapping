***********************************************************************
*  MEMORY TRACE EXAMPLE
*  Demonstrates tracing storage contents and addresses
***********************************************************************
MEMTRACE        CSECT
MEMTRACE        AMODE 31
MEMTRACE        RMODE ANY

         STM   R14,R12,12(R13)
         LR    R12,R15
         USING MEMTRACE,R12

*----------------------------------------------------------------------
* Load address of a storage block and trace its contents
*----------------------------------------------------------------------
         LA    R2,BLOCK               Address of block
         L     R3,0(R2)               Load first word
         L     R4,4(R2)               Load second word

*----------------------------------------------------------------------
* Example: Compare values
*----------------------------------------------------------------------
         C     R3,R4                  Compare first two words
         BE    EQUAL                  Branch if equal

         B     DONE

EQUAL    DS    0H
         LA    R5,MSG_EQUAL           Load message pointer

DONE     DS    0H
         LM    R14,R12,12(R13)
         BR    R14

*----------------------------------------------------------------------
* Storage block and messages
*----------------------------------------------------------------------
BLOCK    DC    F'100',F'100',F'200'
MSG_EQUAL DC   C'FIRST TWO WORDS MATCH'

         END   MEMTRACE
