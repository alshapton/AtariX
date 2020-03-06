

   ; Start of vertical blank processing

             lda #0
             sta VBLANK

             lda #2
             sta VSYNC      ; Vertical SYNC - indicates start of a new frame
                            ; byte 2 being set indicates start of vertical sync

             ; 3 scanlines of VSYNCH signal... - these are at the top of the screen
             ; Note that WSYNC is a 'strobe' register - meaning that ANY value > 0 
             ; will suffice. to trigger the stopping of the 6502
             sta WSYNC ; halt the 6502 till the TIA finishes the scan line then
             sta WSYNC ; reactivates the 6502 only to be told to shut off again
             sta WSYNC ; for the 3rd blank scan line. 
             
             lda #0
             sta VSYNC      ; Vertical SYNC 
                            ; All bytes being 0 indicates end of vertical sync           
         


