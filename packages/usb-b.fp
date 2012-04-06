# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited

# Element[element_flags, description, pcb-name, value, mark_x,
# mark_y, text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "USB_B" "" "" 0 0 -23622 -21653 0 100 0x00000000]
(

# ElementArc(x y Width Height StartAngle Delta Thickness)


# Silk screen around PCB
	ElementLine[-23622   -14400   23622  -14400   1000]
	ElementLine[-23622   -14400  -23622    3600   1000]
	ElementLine[ 23622   -14400   23622    3600   1000]

	ElementArc[  23622    10629    7029    7029   0 360 1000]
	ElementArc[ -23622    10629    7029    7029   0 360 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# Pin[x, y, Thickness, Clearance, Mask, DrillHole,
#     Name, Number, Flags)


# Data interface header
	Pin[  4921  -7874  7086  1600 7386 3937 "1"  "1"   0x00000001]
	Pin[ -4921  -7874  7086  1600 7386 3937 "2"  "2"   0x00000001]
	Pin[ -4921      0  7086  1600 7386 3937 "3"  "3"   0x00000001]
	Pin[  4921      0  7086  1600 7386 3937 "4"  "4"   0x00000001]

# Shield Ground / mounting tabs
	Pin[ 23622  10629 12204  1600 12504 9055 "5"   "5"    0x00000001]
	Pin[-23622  10629 12204  1600 12504 9055 "5"   "5"    0x00000001]

)
