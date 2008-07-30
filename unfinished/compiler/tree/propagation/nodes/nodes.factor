! Copyright (C) 2004, 2008 Slava Pestov.
! See http://factorcode.org/license.txt for BSD license.
USING: sequences accessors kernel assocs sequences
compiler.tree
compiler.tree.def-use
compiler.tree.propagation.info ;
IN: compiler.tree.propagation.nodes

SYMBOL: +constraints+
SYMBOL: +outputs+

GENERIC: propagate-before ( node -- )

GENERIC: propagate-after ( node -- )

GENERIC: propagate-around ( node -- )

: (propagate) ( node -- ) [ propagate-around ] each ;

: extract-value-info ( values -- assoc )
    [ dup value-info ] H{ } map>assoc ;

: annotate-node ( node -- )
    dup
    [ node-defs-values ] [ node-uses-values ] bi append
    extract-value-info
    >>info drop ;

M: node propagate-before drop ;

M: node propagate-after drop ;

M: node propagate-around
    [ propagate-before ] [ annotate-node ] [ propagate-after ] tri ;
