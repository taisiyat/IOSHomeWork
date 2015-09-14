//
//  TKAMacro.h
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#define TKASquareFrameOriginWithOrigin(axis)\
    nextSquareFrame.origin.axis = screenFrame.origin.axis;

#define TKASquareFrameOriginWithSize(axis, dimension)\
    nextSquareFrame.origin.axis = screenFrame.size.dimension - squareFrame.size.dimension;
