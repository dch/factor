! Copyright (C) 2009, 2010 Slava Pestov.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel math namespaces ;
IN: compiler.cfg.stack-frame

TUPLE: stack-frame
{ params integer }
{ allot-area-size integer }
{ allot-area-align integer }
{ spill-area-size integer }
{ spill-area-align integer }

{ total-size integer }
{ allot-area-base integer }
{ spill-area-base integer } ;

: local-allot-offset ( n -- offset )
    stack-frame get allot-area-base>> + ;

: spill-offset ( n -- offset )
    stack-frame get spill-area-base>> + ;

: (stack-frame-size) ( stack-frame -- n )
    [ spill-area-base>> ] [ spill-area-size>> ] bi + ;
