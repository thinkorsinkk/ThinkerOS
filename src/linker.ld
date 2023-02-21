ENTRY(_start)
SECTIONS
{
/*    virtual addresses start at higher half*/
    . = 0xFFFFFF8000000000;

    .text : AT(ADDR(.text) - 0xFFFFFF8000000000)
    {
        _code = .;
        *(.text)
        *(.rodata*)
        . = ALIGN(0x1000);
    }

   .data : AT(ADDR(.data) - 0xFFFFFF8000000000)
   {
        _data = .;
        *(.data)
        . = ALIGN(0x1000);
   }

   .eh_frame : AT(ADDR(.eh_frame) - 0xFFFFFF8000000000)
   {
       _ehframe = .;
       *(.eh_frame)
        . = ALIGN(0x1000);
   }

   .bss : AT(ADDR(.bss) - 0xFFFFFF8000000000)
   {
       _bss = .;
       *(.bss)

       /*
        * You usually need to include generated COMMON symbols
        * under kernel BSS section or use gcc's -fno-common
        */

        *(COMMON)
       . = ALIGN(0x1000);
   }

   _end = .;

   /DISCARD/ :
   {
        *(.comment)
   }
}
