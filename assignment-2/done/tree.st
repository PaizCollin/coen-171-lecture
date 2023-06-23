Object subclass: #Node
    instanceVariableNames: 'data left right'
    classVariableNames: ''
    poolDictionaries: ''
!

!Node methodsFor: 'initialization'!

data: anObject
    data := anObject
!!

!Node methodsFor: 'manipulation'!

insert: anObject
    anObject < data ifTrue: [
        left = nil ifTrue: [
            left := Node new data: anObject
        ] ifFalse: [
            left insert: anObject
        ]
    ].

    anObject > data ifTrue: [
        right isNil ifTrue: [
            right := Node new data: anObject
        ] ifFalse: [
            right insert: anObject
        ]
    ].
!

member: anObject
    anObject < data ifTrue: [
        left = nil ifTrue: [
            ^false
        ] ifFalse: [
            ^left member: anObject
        ]
    ].

    anObject > data ifTrue: [
        right = nil ifTrue: [
            ^false
        ] ifFalse: [
            ^right member: anObject
        ]
    ].

    ^true.
!!

Object subclass: #Tree
    instanceVariableNames: 'root'
    classVariableNames: ''
    poolDictionaries: ''
!

!Tree methodsFor: 'manipulation'!

insert: anObject
    root isNil ifTrue: [ 
        root := Node new data: anObject 
    ] ifFalse: [
        root insert: anObject
    ].
!

member: anObject
    root isNil ifTrue: [
        ^false
    ] ifFalse: [
        ^root member: anObject
    ].
!!