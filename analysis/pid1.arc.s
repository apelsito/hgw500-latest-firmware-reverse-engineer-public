
init-core-r1.elf:     file format elf32-littlearc


Disassembly of section .text:

00010094 <eq>:
   10094:	8840                	ldb_s	r2,[r0,0]
   10096:	8960                	ldb_s	r3,[r1,0]
   10098:	ea03                	breq_s	r2,0,6	;1009e <eq+0xa>
   1009a:	0a0f 00c0           	breq	r2,r3,14	;100a6 <eq+0x12>
   1009e:	7270                	cmp_s	r2,r3
   100a0:	d801                	mov_s	r0,0x1
   100a2:	78c0                	sub_s.ne	r0,r0,r0
   100a4:	7ee0                	j_s	[blink]
   100a6:	6801                	add_s	r0,r0,0x1
   100a8:	6921                	add_s	r1,r1,0x1
   100aa:	f1f6                	b_s	-20	;10094 <eq>

000100ac <zero>:
   100ac:	792b                	tst_s	r1,r1
   100ae:	7ce0                	jeq_s	[blink]
   100b0:	da00                	mov_s	r2,0
   100b2:	2142 0041           	sub	r1,r1,0x1
   100b6:	1801 0092           	stb.ab	r2,[r0,1]
   100ba:	f1fa                	b_s	-12	;100ac <zero>

000100bc <reap>:
   100bc:	c1a1                	sub_s	sp,sp,0x4
   100be:	208a 0fff           	mov	r0,-1
   100c2:	718b                	mov_s	r1,sp
   100c4:	da01                	mov_s	r2,0x1
   100c6:	db00                	mov_s	r3,0
   100c8:	244a 0000           	mov	r4,0
   100cc:	254a 0000           	mov	r5,0
   100d0:	208a 1104           	mov	r8,260
   100d4:	226f 003f           	trap0
   100d8:	08e7 8053           	brge	r0,0x1,-26	;100be <reap+0x2>
   100dc:	c0a1                	add_s	sp,sp,0x4
   100de:	7ee0                	j_s	[blink]

000100e0 <unused_signal_handler>:
   100e0:	7ee0                	j_s	[blink]
   100e2:	78e0                	nop_s

000100e4 <syscall6.constprop.0.isra.0>:
   100e4:	254a 0000           	mov	r5,0
   100e8:	7019                	mov_s	r8,r0
   100ea:	7028                	mov_s	r0,r1
   100ec:	7148                	mov_s	r1,r2
   100ee:	7268                	mov_s	r2,r3
   100f0:	7388                	mov_s	r3,r4
   100f2:	244a 0000           	mov	r4,0
   100f6:	226f 003f           	trap0
   100fa:	7ee0                	j_s	[blink]

000100fc <pause_ms>:
   100fc:	c0f1                	push_s	blink
   100fe:	c5e1                	push_s	r13
   10100:	c1a4                	sub_s	sp,sp,0x10
   10102:	218a 0a0f           	mov	r1,1000
   10106:	7508                	mov_s	r13,r0
   10108:	08ae 0080           	bl	4268	;111b4 <__divsi3>
   1010c:	c040                	st_s	r0,[sp,0]
   1010e:	b85f                	asr_s	r0,r0,0x1f
   10110:	218a 0a0f           	mov	r1,1000
   10114:	c041                	st_s	r0,[sp,0x4]
   10116:	70a9                	mov_s	r0,r13
   10118:	08ba 0080           	bl	4280	;111d0 <__modsi3>
   1011c:	210a 0f80 000f 4240 	mov	r1,0xf4240
   10124:	201b 0043           	mpyh	r3,r0,r1
   10128:	244a 0000           	mov	r4,0
   1012c:	201d 0042           	mpyu	r2,r0,r1
   10130:	d901                	mov_s	r1,0x1
   10132:	c343                	st_s	r3,[sp,0xc]
   10134:	208a 05c6           	mov	r0,407
   10138:	c242                	st_s	r2,[sp,0x8]
   1013a:	738b                	mov_s	r3,sp
   1013c:	da00                	mov_s	r2,0
   1013e:	0faa ffcf           	bl	-88	;100e4 <syscall6.constprop.0.isra.0>
   10142:	c0a4                	add_s	sp,sp,0x10
   10144:	c5c1                	pop_s	r13
   10146:	c0d1                	pop_s	blink
   10148:	7ee0                	j_s	[blink]
   1014a:	78e0                	nop_s

0001014c <say>:
   1014c:	da00                	mov_s	r2,0
   1014e:	7108                	mov_s	r1,r0
   10150:	6158                	add_s	r0,r1,r2
   10152:	8800                	ldb_s	r0,[r0,0]
   10154:	e893                	brne_s	r0,0,38	;1017a <say+0x2e>
   10156:	7a4b                	tst_s	r2,r2
   10158:	7ce0                	jeq_s	[blink]
   1015a:	d801                	mov_s	r0,0x1
   1015c:	db00                	mov_s	r3,0
   1015e:	244a 0000           	mov	r4,0
   10162:	254a 0000           	mov	r5,0
   10166:	208a 1001           	mov	r8,64
   1016a:	226f 003f           	trap0
   1016e:	e080                	cmp_s	r0,0
   10170:	20e0 07cc           	jle	[blink]
   10174:	6119                	add_s	r1,r1,r0
   10176:	7a02                	sub_s	r2,r2,r0
   10178:	f1ef                	b_s	-34	;10156 <say+0xa>
   1017a:	6a41                	add_s	r2,r2,0x1
   1017c:	f1ea                	b_s	-44	;10150 <say+0x4>
   1017e:	78e0                	nop_s

00010180 <number>:
   10180:	c0f1                	push_s	blink
   10182:	c6e1                	push_s	r14
   10184:	c5e1                	push_s	r13
   10186:	c1a6                	sub_s	sp,sp,0x18
   10188:	d900                	mov_s	r1,0
   1018a:	7e11                	abs_s	r14,r0
   1018c:	1c17 3042           	stb	r1,[sp,23]
   10190:	dd17                	mov_s	r13,0x17
   10192:	da1f                	mov_s	r2,0x1f
   10194:	d900                	mov_s	r1,0
   10196:	db00                	mov_s	r3,0
   10198:	2e01 108c           	lsr	r12,r14,r2
   1019c:	6931                	asl_s	r1,r1,0x1
   1019e:	bcc0                	bmsk_s	r12,r12,0
   101a0:	7985                	or_s	r1,r1,r12
   101a2:	e189                	cmp_s	r1,0x9
   101a4:	24ca 106d           	mov.hi	r12,0x1
   101a8:	2cc0 108d           	asl.hi	r12,r12,r2
   101ac:	2242 0042           	sub	r2,r2,0x1
   101b0:	21c2 02ad           	sub.hi	r1,r1,0xa
   101b4:	23c5 030d           	or.hi	r3,r3,r12
   101b8:	228c 8fff           	cmp	r2,-1
   101bc:	f5ee                	bne_s	-36	;10198 <number+0x18>
   101be:	2542 1042           	sub	r2,r13,0x1
   101c2:	748b                	mov_s	r12,sp
   101c4:	645e                	add_s	r14,r12,r2
   101c6:	e130                	add_s	r1,r1,0x30
   101c8:	ae20                	stb_s	r1,[r14,0]
   101ca:	7b6b                	tst_s	r3,r3
   101cc:	f410                	bne_s	32	;101ec <number+0x6c>
   101ce:	0811 0013           	brge	r0,0,16	;101dc <number+0x5c>
   101d2:	2557 1042           	sub1	r2,r13,0x1
   101d6:	6458                	add_s	r0,r12,r2
   101d8:	d92d                	mov_s	r1,0x2d
   101da:	a820                	stb_s	r1,[r0,0]
   101dc:	6458                	add_s	r0,r12,r2
   101de:	0f72 ffcf           	bl	-144	;1014c <say>
   101e2:	c0a6                	add_s	sp,sp,0x18
   101e4:	c5c1                	pop_s	r13
   101e6:	c6c1                	pop_s	r14
   101e8:	c0d1                	pop_s	blink
   101ea:	7ee0                	j_s	[blink]
   101ec:	7668                	mov_s	r14,r3
   101ee:	7548                	mov_s	r13,r2
   101f0:	f1d1                	b_s	-94	;10192 <number+0x12>
   101f2:	78e0                	nop_s

000101f4 <report>:
   101f4:	c0f1                	push_s	blink
   101f6:	c5e1                	push_s	r13
   101f8:	7528                	mov_s	r13,r1
   101fa:	0f56 ffcf           	bl	-172	;1014c <say>
   101fe:	200a 0f80 0001 125c 	mov	r0,0x1125c
   10206:	0f4a ffcf           	bl	-184	;1014c <say>
   1020a:	70a9                	mov_s	r0,r13
   1020c:	0f76 ffcf           	bl	-140	;10180 <number>
   10210:	200a 0f80 0001 142c 	mov	r0,0x1142c
   10218:	c5c1                	pop_s	r13
   1021a:	c0d1                	pop_s	blink
   1021c:	0731 ffcf           	b	-208	;1014c <say>

00010220 <cat>:
   10220:	7108                	mov_s	r1,r0
   10222:	da00                	mov_s	r2,0
   10224:	208a 073e           	mov	r0,-100
   10228:	db00                	mov_s	r3,0
   1022a:	244a 0000           	mov	r4,0
   1022e:	254a 0000           	mov	r5,0
   10232:	204a 1e00           	mov	r8,0x38
   10236:	226f 003f           	trap0
   1023a:	240a 9000           	mov.f	r12,r0
   1023e:	0076 0003           	bp	118	;102b2 <cat+0x92>
   10242:	7189                	mov_s	r1,r12
   10244:	200a 0f80 0001 1260 	mov	r0,0x11260
   1024c:	07a9 ffcf           	b	-88	;101f4 <report>
   10250:	d801                	mov_s	r0,0x1
   10252:	2400 3341           	add	r1,sp,r13
   10256:	2602 1342           	sub	r2,r14,r13
   1025a:	db00                	mov_s	r3,0
   1025c:	244a 0000           	mov	r4,0
   10260:	254a 0000           	mov	r5,0
   10264:	208a 1001           	mov	r8,64
   10268:	226f 003f           	trap0
   1026c:	080b 0052           	brlt	r0,0x1,10	;10276 <cat+0x56>
   10270:	651d                	add_s	r13,r13,r0
   10272:	0de1 9384           	brlo	r13,r14,-32	;10250 <cat+0x30>
   10276:	7089                	mov_s	r0,r12
   10278:	718b                	mov_s	r1,sp
   1027a:	228a 0004           	mov	r2,256
   1027e:	db00                	mov_s	r3,0
   10280:	244a 0000           	mov	r4,0
   10284:	254a 0000           	mov	r5,0
   10288:	204a 1fc0           	mov	r8,0x3f
   1028c:	226f 003f           	trap0
   10290:	7608                	mov_s	r14,r0
   10292:	080b 0052           	brlt	r0,0x1,10	;1029a <cat+0x7a>
   10296:	dd00                	mov_s	r13,0
   10298:	f1dc                	b_s	-72	;10250 <cat+0x30>
   1029a:	da00                	mov_s	r2,0
   1029c:	7189                	mov_s	r1,r12
   1029e:	d839                	mov_s	r0,0x39
   102a0:	0e46 ffcf           	bl	-444	;100e4 <syscall6.constprop.0.isra.0>
   102a4:	2456 381c           	add3	sp,sp,0x20
   102a8:	c5c1                	pop_s	r13
   102aa:	c6c1                	pop_s	r14
   102ac:	c7c1                	pop_s	r15
   102ae:	c0d1                	pop_s	blink
   102b0:	7ee0                	j_s	[blink]
   102b2:	c0f1                	push_s	blink
   102b4:	c7e1                	push_s	r15
   102b6:	c6e1                	push_s	r14
   102b8:	c5e1                	push_s	r13
   102ba:	2459 381c           	sub3	sp,sp,0x20
   102be:	f1dd                	b_s	-70	;10276 <cat+0x56>

000102c0 <child>:
   102c0:	c0f1                	push_s	blink
   102c2:	c6e1                	push_s	r14
   102c4:	c5e1                	push_s	r13
   102c6:	c1a1                	sub_s	sp,sp,0x4
   102c8:	da00                	mov_s	r2,0
   102ca:	7608                	mov_s	r14,r0
   102cc:	7428                	mov_s	r12,r1
   102ce:	d811                	mov_s	r0,0x11
   102d0:	d900                	mov_s	r1,0
   102d2:	db00                	mov_s	r3,0
   102d4:	244a 0000           	mov	r4,0
   102d8:	254a 0000           	mov	r5,0
   102dc:	208a 1703           	mov	r8,220
   102e0:	226f 003f           	trap0
   102e4:	250a 9000           	mov.f	r13,r0
   102e8:	f41f                	bne_s	62	;10326 <child+0x66>
   102ea:	244a 0200           	mov	r4,0x8
   102ee:	220a 0f80 0001 232c 	mov	r2,0x1232c
   102f6:	d901                	mov_s	r1,0x1
   102f8:	d887                	mov_s	r0,0x87
   102fa:	0dee ffcf           	bl	-532	;100e4 <syscall6.constprop.0.isra.0>
   102fe:	8620                	ld_s	r1,[r14,0]
   10300:	244a 0000           	mov	r4,0
   10304:	230a 0f80 0001 2334 	mov	r3,0x12334
   1030c:	72c9                	mov_s	r2,r14
   1030e:	d8dd                	mov_s	r0,0xdd
   10310:	0dd6 ffcf           	bl	-556	;100e4 <syscall6.constprop.0.isra.0>
   10314:	244a 0000           	mov	r4,0
   10318:	db00                	mov_s	r3,0
   1031a:	da00                	mov_s	r2,0
   1031c:	d97f                	mov_s	r1,0x7f
   1031e:	d85d                	mov_s	r0,0x5d
   10320:	0dc6 ffcf           	bl	-572	;100e4 <syscall6.constprop.0.isra.0>
   10324:	f000                	b_s	0	;10324 <child+0x64>
   10326:	21ca 0344           	mov.n	r1,r13
   1032a:	20ca 0f84 0001 126c 	mov.n	r0,0x1126c
   10332:	0034 0004           	bn	52	;10364 <child+0xa4>
   10336:	7c8b                	tst_s	r12,r12
   10338:	21ca 0342           	mov.ne	r1,r13
   1033c:	20ca 0f82 0001 1278 	mov.ne	r0,0x11278
   10344:	f410                	bne_s	32	;10364 <child+0xa4>
   10346:	c440                	st_s	r12,[sp,0]
   10348:	718b                	mov_s	r1,sp
   1034a:	208a 1104           	mov	r8,260
   1034e:	226f 003f           	trap0
   10352:	250a 9000           	mov.f	r13,r0
   10356:	0020 0003           	bp	32	;10374 <child+0xb4>
   1035a:	71a9                	mov_s	r1,r13
   1035c:	200a 0f80 0001 1288 	mov	r0,0x11288
   10364:	0e92 ffcf           	bl	-368	;101f4 <report>
   10368:	70a9                	mov_s	r0,r13
   1036a:	c0a1                	add_s	sp,sp,0x4
   1036c:	c5c1                	pop_s	r13
   1036e:	c6c1                	pop_s	r14
   10370:	c0d1                	pop_s	blink
   10372:	7ee0                	j_s	[blink]
   10374:	c100                	ld_s	r1,[sp,0]
   10376:	200a 0f80 0001 129c 	mov	r0,0x1129c
   1037e:	0e7a ffcf           	bl	-392	;101f4 <report>
   10382:	c500                	ld_s	r13,[sp,0]
   10384:	f1f2                	b_s	-28	;10368 <child+0xa8>
   10386:	78e0                	nop_s

00010388 <radio_country>:
   10388:	c0f1                	push_s	blink
   1038a:	c1a5                	sub_s	sp,sp,0x14
   1038c:	da14                	mov_s	r2,0x14
   1038e:	210a 0f80 0001 2344 	mov	r1,0x12344
   10396:	708b                	mov_s	r0,sp
   10398:	0cce 0000           	bl	1228	;10864 <memcpy>
   1039c:	d900                	mov_s	r1,0
   1039e:	708b                	mov_s	r0,sp
   103a0:	0f22 ffcf           	bl	-224	;102c0 <child>
   103a4:	c0a5                	add_s	sp,sp,0x14
   103a6:	c0d1                	pop_s	blink
   103a8:	7ee0                	j_s	[blink]
   103aa:	78e0                	nop_s

000103ac <radio_ap>:
   103ac:	c0f1                	push_s	blink
   103ae:	c1a8                	sub_s	sp,sp,0x20
   103b0:	da20                	mov_s	r2,0x20
   103b2:	210a 0f80 0001 2358 	mov	r1,0x12358
   103ba:	708b                	mov_s	r0,sp
   103bc:	0caa 0000           	bl	1192	;10864 <memcpy>
   103c0:	d900                	mov_s	r1,0
   103c2:	708b                	mov_s	r0,sp
   103c4:	0efe ffcf           	bl	-260	;102c0 <child>
   103c8:	c0a8                	add_s	sp,sp,0x20
   103ca:	c0d1                	pop_s	blink
   103cc:	7ee0                	j_s	[blink]
   103ce:	78e0                	nop_s

000103d0 <ssh_start>:
   103d0:	c0f1                	push_s	blink
   103d2:	c1ac                	sub_s	sp,sp,0x30
   103d4:	da30                	mov_s	r2,0x30
   103d6:	210a 0f80 0001 2378 	mov	r1,0x12378
   103de:	708b                	mov_s	r0,sp
   103e0:	0c86 0000           	bl	1156	;10864 <memcpy>
   103e4:	d901                	mov_s	r1,0x1
   103e6:	708b                	mov_s	r0,sp
   103e8:	0eda ffcf           	bl	-296	;102c0 <child>
   103ec:	c0ac                	add_s	sp,sp,0x30
   103ee:	c0d1                	pop_s	blink
   103f0:	7ee0                	j_s	[blink]
   103f2:	78e0                	nop_s

000103f4 <https_start>:
   103f4:	c0f1                	push_s	blink
   103f6:	c1bd                	sub_s	sp,sp,0x74
   103f8:	da74                	mov_s	r2,0x74
   103fa:	210a 0f80 0001 23a8 	mov	r1,0x123a8
   10402:	708b                	mov_s	r0,sp
   10404:	0c62 0000           	bl	1120	;10864 <memcpy>
   10408:	d901                	mov_s	r1,0x1
   1040a:	708b                	mov_s	r0,sp
   1040c:	0eb6 ffcf           	bl	-332	;102c0 <child>
   10410:	c0bd                	add_s	sp,sp,0x74
   10412:	c0d1                	pop_s	blink
   10414:	7ee0                	j_s	[blink]
   10416:	78e0                	nop_s

00010418 <load_driver>:
   10418:	c0f1                	push_s	blink
   1041a:	c6e1                	push_s	r14
   1041c:	c5e1                	push_s	r13
   1041e:	250a 1f80 0001 45d0 	mov	r13,0x145d0
   10426:	78e0                	nop_s
   10428:	8500                	ld_s	r0,[r13,0]
   1042a:	e80b                	breq_s	r0,0,22	;1043e <load_driver+0x26>
   1042c:	200a 0f80 0001 12ac 	mov	r0,0x112ac
   10434:	c5c1                	pop_s	r13
   10436:	c6c1                	pop_s	r14
   10438:	c0d1                	pop_s	blink
   1043a:	0515 ffcf           	b	-748	;1014c <say>
   1043e:	208a 073e           	mov	r0,-100
   10442:	210a 0f80 0001 12c0 	mov	r1,0x112c0
   1044a:	da00                	mov_s	r2,0
   1044c:	db00                	mov_s	r3,0
   1044e:	244a 0000           	mov	r4,0
   10452:	254a 0000           	mov	r5,0
   10456:	204a 1e00           	mov	r8,0x38
   1045a:	226f 003f           	trap0
   1045e:	240a 9000           	mov.f	r12,r0
   10462:	001a 0003           	bp	26	;1047a <load_driver+0x62>
   10466:	7189                	mov_s	r1,r12
   10468:	200a 0f80 0001 12dc 	mov	r0,0x112dc
   10470:	c5c1                	pop_s	r13
   10472:	c6c1                	pop_s	r14
   10474:	c0d1                	pop_s	blink
   10476:	0581 ffcf           	b	-640	;101f4 <report>
   1047a:	210a 0f80 0001 1500 	mov	r1,0x11500
   10482:	208a 1444           	mov	r8,273
   10486:	226f 003f           	trap0
   1048a:	7608                	mov_s	r14,r0
   1048c:	7189                	mov_s	r1,r12
   1048e:	d839                	mov_s	r0,0x39
   10490:	0c56 ffcf           	bl	-940	;100e4 <syscall6.constprop.0.isra.0>
   10494:	71c9                	mov_s	r1,r14
   10496:	200a 0f80 0001 12ec 	mov	r0,0x112ec
   1049e:	0d5a ffcf           	bl	-680	;101f4 <report>
   104a2:	ee84                	brne_s	r14,0,8	;104a8 <load_driver+0x90>
   104a4:	d801                	mov_s	r0,0x1
   104a6:	a500                	st_s	r0,[r13,0]
   104a8:	78e0                	nop_s
   104aa:	78e0                	nop_s
   104ac:	c5c1                	pop_s	r13
   104ae:	c6c1                	pop_s	r14
   104b0:	c0d1                	pop_s	blink
   104b2:	7ee0                	j_s	[blink]

000104b4 <iface>:
   104b4:	c0f1                	push_s	blink
   104b6:	1cfc b408           	st.aw	r16,[sp,-4]
   104ba:	c7e1                	push_s	r15
   104bc:	c6e1                	push_s	r14
   104be:	c5e1                	push_s	r13
   104c0:	c1a8                	sub_s	sp,sp,0x20
   104c2:	7608                	mov_s	r14,r0
   104c4:	7728                	mov_s	r15,r1
   104c6:	708b                	mov_s	r0,sp
   104c8:	d920                	mov_s	r1,0x20
   104ca:	0be6 ffcf           	bl	-1052	;100ac <zero>
   104ce:	d868                	mov_s	r0,0x68
   104d0:	1c02 3002           	stb	r0,[sp,2]
   104d4:	2656 1180           	add3	r0,r14,0x6
   104d8:	1c03 3002           	stb	r0,[sp,3]
   104dc:	1c00 3f84 0000 7465 	sth	0x7465,[sp,0]
   104e4:	d802                	mov_s	r0,0x2
   104e6:	d902                	mov_s	r1,0x2
   104e8:	da00                	mov_s	r2,0
   104ea:	db00                	mov_s	r3,0
   104ec:	244a 0000           	mov	r4,0
   104f0:	254a 0000           	mov	r5,0
   104f4:	208a 1183           	mov	r8,198
   104f8:	226f 003f           	trap0
   104fc:	250a 9000           	mov.f	r13,r0
   10500:	0022 0003           	bp	34	;10522 <iface+0x6e>
   10504:	71a9                	mov_s	r1,r13
   10506:	200a 0f80 0001 1310 	mov	r0,0x11310
   1050e:	0cea ffcf           	bl	-792	;101f4 <report>
   10512:	c0a8                	add_s	sp,sp,0x20
   10514:	c5c1                	pop_s	r13
   10516:	c6c1                	pop_s	r14
   10518:	c7c1                	pop_s	r15
   1051a:	1404 3410           	ld.ab	r16,[sp,4]
   1051e:	c0d1                	pop_s	blink
   10520:	7ee0                	j_s	[blink]
   10522:	ef35                	breq_s	r15,0,106	;1058a <iface+0xd6>
   10524:	d902                	mov_s	r1,0x2
   10526:	1c10 3044           	sth	r1,[sp,16]
   1052a:	d901                	mov_s	r1,0x1
   1052c:	1c16 3042           	stb	r1,[sp,22]
   10530:	2654 1b41           	add1	r1,r14,0x2d
   10534:	1c17 3042           	stb	r1,[sp,23]
   10538:	1c14 3f84 ffff a8c0 	sth	0xffffa8c0,[sp,20]
   10540:	210a 0f80 0000 8916 	mov	r1,0x8916
   10548:	728b                	mov_s	r2,sp
   1054a:	204a 1740           	mov	r8,0x1d
   1054e:	226f 003f           	trap0
   10552:	210a 8000           	mov.f	r1,r0
   10556:	20ca 0f82 0001 131c 	mov.ne	r0,0x1131c
   1055e:	f45e                	bne_s	188	;10618 <iface+0x164>
   10560:	208a 0fff           	mov	r0,-1
   10564:	1c14 3004           	sth	r0,[sp,20]
   10568:	d8ff                	mov_s	r0,0xff
   1056a:	1c16 3004           	sth	r0,[sp,22]
   1056e:	210a 0f80 0000 891c 	mov	r1,0x891c
   10576:	70a9                	mov_s	r0,r13
   10578:	226f 003f           	trap0
   1057c:	210a 8000           	mov.f	r1,r0
   10580:	20ca 0f82 0001 1328 	mov.ne	r0,0x11328
   10588:	f448                	bne_s	144	;10618 <iface+0x164>
   1058a:	c084                	add_s	r0,sp,0x10
   1058c:	d910                	mov_s	r1,0x10
   1058e:	0b22 ffcf           	bl	-1248	;100ac <zero>
   10592:	70a9                	mov_s	r0,r13
   10594:	210a 0f80 0000 8913 	mov	r1,0x8913
   1059c:	728b                	mov_s	r2,sp
   1059e:	db00                	mov_s	r3,0
   105a0:	244a 0000           	mov	r4,0
   105a4:	254a 0000           	mov	r5,0
   105a8:	204a 1740           	mov	r8,0x1d
   105ac:	226f 003f           	trap0
   105b0:	210a 8000           	mov.f	r1,r0
   105b4:	20ca 0f82 0001 1334 	mov.ne	r0,0x11334
   105bc:	f42e                	bne_s	92	;10618 <iface+0x164>
   105be:	1410 3140           	ldh.x	r0,[sp,16]
   105c2:	7feb                	tst_s	r15,r15
   105c4:	210a 0f80 0000 8914 	mov	r1,0x8914
   105cc:	20cf 0022           	bset.ne	r0,r0,0
   105d0:	20d0 0021           	bclr.eq	r0,r0,0
   105d4:	1c10 3004           	sth	r0,[sp,16]
   105d8:	db00                	mov_s	r3,0
   105da:	70a9                	mov_s	r0,r13
   105dc:	244a 0000           	mov	r4,0
   105e0:	254a 0000           	mov	r5,0
   105e4:	204a 1740           	mov	r8,0x1d
   105e8:	226f 003f           	trap0
   105ec:	7ecb                	tst_s	r14,r14
   105ee:	701a                	mov_s	r16,r0
   105f0:	20ca 0f82 0001 12f4 	mov.ne	r0,0x112f4
   105f8:	20ca 0f81 0001 12fc 	mov.eq	r0,0x112fc
   10600:	0b4e ffcf           	bl	-1204	;1014c <say>
   10604:	7feb                	tst_s	r15,r15
   10606:	710a                	mov_s	r1,r16
   10608:	20ca 0f82 0001 1304 	mov.ne	r0,0x11304
   10610:	20ca 0f81 0001 1308 	mov.eq	r0,0x11308
   10618:	0bde ffcf           	bl	-1060	;101f4 <report>
   1061c:	244a 0000           	mov	r4,0
   10620:	db00                	mov_s	r3,0
   10622:	da00                	mov_s	r2,0
   10624:	71a9                	mov_s	r1,r13
   10626:	d839                	mov_s	r0,0x39
   10628:	0abe ffcf           	bl	-1348	;100e4 <syscall6.constprop.0.isra.0>
   1062c:	f173                	b_s	-282	;10512 <iface+0x5e>
   1062e:	78e0                	nop_s

00010630 <address_status>:
   10630:	c0f1                	push_s	blink
   10632:	c7e1                	push_s	r15
   10634:	c6e1                	push_s	r14
   10636:	c5e1                	push_s	r13
   10638:	c1a8                	sub_s	sp,sp,0x20
   1063a:	d920                	mov_s	r1,0x20
   1063c:	7708                	mov_s	r15,r0
   1063e:	708b                	mov_s	r0,sp
   10640:	0a6e ffcf           	bl	-1428	;100ac <zero>
   10644:	d868                	mov_s	r0,0x68
   10646:	1c02 3002           	stb	r0,[sp,2]
   1064a:	2756 1180           	add3	r0,r15,0x6
   1064e:	1c03 3002           	stb	r0,[sp,3]
   10652:	1c00 3f84 0000 7465 	sth	0x7465,[sp,0]
   1065a:	d802                	mov_s	r0,0x2
   1065c:	d902                	mov_s	r1,0x2
   1065e:	da00                	mov_s	r2,0
   10660:	db00                	mov_s	r3,0
   10662:	244a 0000           	mov	r4,0
   10666:	254a 0000           	mov	r5,0
   1066a:	208a 1183           	mov	r8,198
   1066e:	226f 003f           	trap0
   10672:	250a 9000           	mov.f	r13,r0
   10676:	0020 0003           	bp	32	;10694 <address_status+0x64>
   1067a:	71a9                	mov_s	r1,r13
   1067c:	200a 0f80 0001 1310 	mov	r0,0x11310
   10684:	0b72 ffcf           	bl	-1168	;101f4 <report>
   10688:	c0a8                	add_s	sp,sp,0x20
   1068a:	c5c1                	pop_s	r13
   1068c:	c6c1                	pop_s	r14
   1068e:	c7c1                	pop_s	r15
   10690:	c0d1                	pop_s	blink
   10692:	7ee0                	j_s	[blink]
   10694:	210a 0f80 0000 8915 	mov	r1,0x8915
   1069c:	728b                	mov_s	r2,sp
   1069e:	204a 1740           	mov	r8,0x1d
   106a2:	226f 003f           	trap0
   106a6:	7feb                	tst_s	r15,r15
   106a8:	7608                	mov_s	r14,r0
   106aa:	20ca 0f82 0001 1344 	mov.ne	r0,0x11344
   106b2:	20ca 0f81 0001 1350 	mov.eq	r0,0x11350
   106ba:	0a96 ffcf           	bl	-1388	;1014c <say>
   106be:	0e99 1010           	breq	r14,0,152	;10754 <address_status+0x124>
   106c2:	200a 0f80 0001 1374 	mov	r0,0x11374
   106ca:	0a86 ffcf           	bl	-1404	;1014c <say>
   106ce:	70c9                	mov_s	r0,r14
   106d0:	0ab2 ffcf           	bl	-1360	;10180 <number>
   106d4:	200a 0f80 0001 142c 	mov	r0,0x1142c
   106dc:	0a72 ffcf           	bl	-1424	;1014c <say>
   106e0:	c084                	add_s	r0,sp,0x10
   106e2:	d910                	mov_s	r1,0x10
   106e4:	09ca ffcf           	bl	-1592	;100ac <zero>
   106e8:	70a9                	mov_s	r0,r13
   106ea:	210a 0f80 0000 8913 	mov	r1,0x8913
   106f2:	728b                	mov_s	r2,sp
   106f4:	db00                	mov_s	r3,0
   106f6:	244a 0000           	mov	r4,0
   106fa:	254a 0000           	mov	r5,0
   106fe:	204a 1740           	mov	r8,0x1d
   10702:	226f 003f           	trap0
   10706:	7feb                	tst_s	r15,r15
   10708:	7608                	mov_s	r14,r0
   1070a:	20ca 0f82 0001 135c 	mov.ne	r0,0x1135c
   10712:	20ca 0f81 0001 1368 	mov.eq	r0,0x11368
   1071a:	0a36 ffcf           	bl	-1484	;1014c <say>
   1071e:	200a 0f80 0001 125c 	mov	r0,0x1125c
   10726:	0a2a ffcf           	bl	-1496	;1014c <say>
   1072a:	ee84                	brne_s	r14,0,8	;10730 <address_status+0x100>
   1072c:	1410 314e           	ldh.x	r14,[sp,16]
   10730:	70c9                	mov_s	r0,r14
   10732:	0a52 ffcf           	bl	-1456	;10180 <number>
   10736:	200a 0f80 0001 142c 	mov	r0,0x1142c
   1073e:	0a12 ffcf           	bl	-1520	;1014c <say>
   10742:	244a 0000           	mov	r4,0
   10746:	db00                	mov_s	r3,0
   10748:	da00                	mov_s	r2,0
   1074a:	71a9                	mov_s	r1,r13
   1074c:	d839                	mov_s	r0,0x39
   1074e:	099a ffcf           	bl	-1640	;100e4 <syscall6.constprop.0.isra.0>
   10752:	f19c                	b_s	-200	;10688 <address_status+0x58>
   10754:	200a 0f80 0001 125c 	mov	r0,0x1125c
   1075c:	de00                	mov_s	r14,0
   1075e:	09f2 ffcf           	bl	-1552	;1014c <say>
   10762:	7ecb                	tst_s	r14,r14
   10764:	20ca 0f82 0001 137c 	mov.ne	r0,0x1137c
   1076c:	20e2 0f82 0001 014c 	jlne	0x1014c
   10774:	2656 1100           	add3	r0,r14,0x4
   10778:	2000 0700           	add	r0,r0,sp
   1077c:	10f4 8080           	ldb	r0,[r0,-12]
   10780:	6ec1                	add_s	r14,r14,0x1
   10782:	0a02 ffcf           	bl	-1536	;10180 <number>
   10786:	0edf 9111           	brne	r14,0x4,-34	;10762 <address_status+0x132>
   1078a:	f1a6                	b_s	-180	;106d4 <address_status+0xa4>

0001078c <load_radio>:
   1078c:	c0f1                	push_s	blink
   1078e:	c7e1                	push_s	r15
   10790:	c6e1                	push_s	r14
   10792:	c5e1                	push_s	r13
   10794:	260a 1f80 0001 45d0 	mov	r14,0x145d0
   1079c:	78e0                	nop_s
   1079e:	8681                	ld_s	r12,[r14,0x4]
   107a0:	0c25 14d4           	brlo	r12,0x13,36	;107c4 <load_radio+0x38>
   107a4:	200a 0f80 0001 13e0 	mov	r0,0x113e0
   107ac:	09a2 ffcf           	bl	-1632	;1014c <say>
   107b0:	200a 0f80 0001 13fc 	mov	r0,0x113fc
   107b8:	c5c1                	pop_s	r13
   107ba:	c6c1                	pop_s	r14
   107bc:	c7c1                	pop_s	r15
   107be:	c0d1                	pop_s	blink
   107c0:	0261 ffcf           	b	-1440	;10220 <cat>
   107c4:	6c93                	asl_s	r12,r12,0x3
   107c6:	208a 073e           	mov	r0,-100
   107ca:	74c7 0001 232c      	add_s	r12,r12,0x1232c
   107d0:	14f0 1001           	ld	r1,[r12,240]
   107d4:	da00                	mov_s	r2,0
   107d6:	db00                	mov_s	r3,0
   107d8:	244a 0000           	mov	r4,0
   107dc:	254a 0000           	mov	r5,0
   107e0:	204a 1e00           	mov	r8,0x38
   107e4:	226f 003f           	trap0
   107e8:	250a 9000           	mov.f	r13,r0
   107ec:	0028 0003           	bp	40	;10814 <load_radio+0x88>
   107f0:	8621                	ld_s	r1,[r14,0x4]
   107f2:	200a 0f80 0001 1380 	mov	r0,0x11380
   107fa:	09fe ffcf           	bl	-1540	;101f4 <report>
   107fe:	71a9                	mov_s	r1,r13
   10800:	200a 0f80 0001 1394 	mov	r0,0x11394
   10808:	c5c1                	pop_s	r13
   1080a:	c6c1                	pop_s	r14
   1080c:	c7c1                	pop_s	r15
   1080e:	c0d1                	pop_s	blink
   10810:	01e5 ffcf           	b	-1564	;101f4 <report>
   10814:	14f4 1001           	ld	r1,[r12,244]
   10818:	208a 1444           	mov	r8,273
   1081c:	226f 003f           	trap0
   10820:	7708                	mov_s	r15,r0
   10822:	71a9                	mov_s	r1,r13
   10824:	d839                	mov_s	r0,0x39
   10826:	08c2 ffcf           	bl	-1856	;100e4 <syscall6.constprop.0.isra.0>
   1082a:	86a1                	ld_s	r13,[r14,0x4]
   1082c:	200a 0f80 0001 13a8 	mov	r0,0x113a8
   10834:	71a9                	mov_s	r1,r13
   10836:	09c2 ffcf           	bl	-1600	;101f4 <report>
   1083a:	71e9                	mov_s	r1,r15
   1083c:	200a 0f80 0001 13bc 	mov	r0,0x113bc
   10844:	09b2 ffcf           	bl	-1616	;101f4 <report>
   10848:	ef0b                	breq_s	r15,0,22	;1085e <load_radio+0xd2>
   1084a:	200a 0f80 0001 13d0 	mov	r0,0x113d0
   10852:	c5c1                	pop_s	r13
   10854:	c6c1                	pop_s	r14
   10856:	c7c1                	pop_s	r15
   10858:	c0d1                	pop_s	blink
   1085a:	00f5 ffcf           	b	-1804	;1014c <say>
   1085e:	6da1                	add_s	r13,r13,0x1
   10860:	a6a1                	st_s	r13,[r14,0x4]
   10862:	f19a                	b_s	-204	;10794 <load_radio+0x8>

00010864 <memcpy>:
   10864:	db00                	mov_s	r3,0
   10866:	7350                	cmp_s	r3,r2
   10868:	20e0 07c6           	jnc	[blink]
   1086c:	c5e1                	push_s	r13
   1086e:	617d                	add_s	r13,r1,r3
   10870:	78e0                	nop_s
   10872:	8da0                	ldb_s	r13,[r13,0]
   10874:	607c                	add_s	r12,r0,r3
   10876:	6b61                	add_s	r3,r3,0x1
   10878:	aca0                	stb_s	r13,[r12,0]
   1087a:	7350                	cmp_s	r3,r2
   1087c:	f7b9                	blo_s	-14	;1086e <memcpy+0xa>
   1087e:	c5c1                	pop_s	r13
   10880:	7ee0                	j_s	[blink]
   10882:	78e0                	nop_s

00010884 <_start>:
   10884:	c0f1                	push_s	blink
   10886:	1cfc b488           	st.aw	r18,[sp,-4]
   1088a:	1cfc b448           	st.aw	r17,[sp,-4]
   1088e:	1cfc b408           	st.aw	r16,[sp,-4]
   10892:	c7e1                	push_s	r15
   10894:	c6e1                	push_s	r14
   10896:	c5e1                	push_s	r13
   10898:	2458 3d5c           	sub2	sp,sp,0x35
   1089c:	d800                	mov_s	r0,0
   1089e:	d900                	mov_s	r1,0
   108a0:	da00                	mov_s	r2,0
   108a2:	db00                	mov_s	r3,0
   108a4:	244a 0000           	mov	r4,0
   108a8:	254a 0000           	mov	r5,0
   108ac:	208a 1b02           	mov	r8,172
   108b0:	226f 003f           	trap0
   108b4:	0823 0050           	breq	r0,0x1,34	;108d6 <_start+0x52>
   108b8:	200a 0f80 0001 141c 	mov	r0,0x1141c
   108c0:	088e ffcf           	bl	-1908	;1014c <say>
   108c4:	244a 0000           	mov	r4,0
   108c8:	db00                	mov_s	r3,0
   108ca:	da00                	mov_s	r2,0
   108cc:	d902                	mov_s	r1,0x2
   108ce:	d85d                	mov_s	r0,0x5d
   108d0:	0816 ffcf           	bl	-2028	;100e4 <syscall6.constprop.0.isra.0>
   108d4:	f000                	b_s	0	;108d4 <_start+0x50>
   108d6:	230a 0f80 0001 1430 	mov	r3,0x11430
   108de:	7168                	mov_s	r1,r3
   108e0:	220a 0f80 0001 1438 	mov	r2,0x11438
   108e8:	d828                	mov_s	r0,0x28
   108ea:	0ffe ff8f           	bl	-2052	;100e4 <syscall6.constprop.0.isra.0>
   108ee:	230a 0f80 0001 1440 	mov	r3,0x11440
   108f6:	7168                	mov_s	r1,r3
   108f8:	244a 0000           	mov	r4,0
   108fc:	220a 0f80 0001 1448 	mov	r2,0x11448
   10904:	d828                	mov_s	r0,0x28
   10906:	0fe2 ff8f           	bl	-2080	;100e4 <syscall6.constprop.0.isra.0>
   1090a:	230a 0f80 0001 1450 	mov	r3,0x11450
   10912:	7168                	mov_s	r1,r3
   10914:	244a 0000           	mov	r4,0
   10918:	220a 0f80 0001 1458 	mov	r2,0x11458
   10920:	d828                	mov_s	r0,0x28
   10922:	0fc6 ff8f           	bl	-2108	;100e4 <syscall6.constprop.0.isra.0>
   10926:	200a 0f80 0001 1464 	mov	r0,0x11464
   1092e:	0822 ffcf           	bl	-2016	;1014c <say>
   10932:	200a 0f80 0001 1488 	mov	r0,0x11488
   1093a:	0816 ffcf           	bl	-2028	;1014c <say>
   1093e:	200a 0f80 0001 14a4 	mov	r0,0x114a4
   10946:	08de ffcf           	bl	-1828	;10220 <cat>
   1094a:	c795                	add_s	r15,sp,0x54
   1094c:	70e9                	mov_s	r0,r15
   1094e:	d914                	mov_s	r1,0x14
   10950:	0f5e ff8f           	bl	-2212	;100ac <zero>
   10954:	d800                	mov_s	r0,0
   10956:	1c54 3f80 0001 00e0 	st	0x100e0,[sp,84]
   1095e:	210a 0f80 0001 232c 	mov	r1,0x1232c
   10966:	da00                	mov_s	r2,0
   10968:	db08                	mov_s	r3,0x8
   1096a:	244a 0000           	mov	r4,0
   1096e:	254a 0000           	mov	r5,0
   10972:	208a 11c2           	mov	r8,135
   10976:	226f 003f           	trap0
   1097a:	081d 0013           	brge	r0,0,28	;10994 <_start+0x110>
   1097e:	200a 0f80 0001 14c0 	mov	r0,0x114c0
   10986:	0fca ff8f           	bl	-2104	;1014c <say>
   1098a:	208a 0a0f           	mov	r0,1000
   1098e:	0f72 ff8f           	bl	-2192	;100fc <pause_ms>
   10992:	f1fd                	b_s	-6	;1098a <_start+0x106>
   10994:	d80f                	mov_s	r0,0xf
   10996:	71e9                	mov_s	r1,r15
   10998:	208a 1182           	mov	r8,134
   1099c:	226f 003f           	trap0
   109a0:	08df 8012           	brlt	r0,0,-34	;1097e <_start+0xfa>
   109a4:	d802                	mov_s	r0,0x2
   109a6:	226f 003f           	trap0
   109aa:	08d7 8012           	brlt	r0,0,-42	;1097e <_start+0xfa>
   109ae:	208a 0fff           	mov	r0,-1
   109b2:	210a 0f80 0001 232c 	mov	r1,0x1232c
   109ba:	da08                	mov_s	r2,0x8
   109bc:	230a 0f80 0008 0800 	mov	r3,0x80800
   109c4:	208a 1281           	mov	r8,74
   109c8:	226f 003f           	trap0
   109cc:	220a 2f80 0001 45cc 	mov	r18,0x145cc
   109d4:	1a00 2000           	st	r0,[r18]
   109d8:	780b                	tst_s	r0,r0
   109da:	07a6 ffc4           	bn	-90	;1097e <_start+0xfa>
   109de:	200a 0f80 0001 14d8 	mov	r0,0x114d8
   109e6:	0f6a ff8f           	bl	-2200	;1014c <say>
   109ea:	210a 2f80 0001 45d0 	mov	r17,0x145d0
   109f2:	0a2a ffcf           	bl	-1496	;10418 <load_driver>
   109f6:	1100 2000           	ld	r0,[r17]
   109fa:	780b                	tst_s	r0,r0
   109fc:	f48d                	bne_s	282	;10b16 <_start+0x292>
   109fe:	200a 0f80 0001 14ec 	mov	r0,0x114ec
   10a06:	0f4a ff8f           	bl	-2232	;1014c <say>
   10a0a:	200a 0f80 0001 1530 	mov	r0,0x11530
   10a12:	de00                	mov_s	r14,0
   10a14:	0f3a ff8f           	bl	-2248	;1014c <say>
   10a18:	0ea6 ff8f           	bl	-2396	;100bc <reap>
   10a1c:	1108 2000           	ld	r0,[r17,8]
   10a20:	e825                	breq_s	r0,0,74	;10a6a <_start+0x1e6>
   10a22:	204a 2000           	mov	r16,0
   10a26:	1908 2400           	st	r16,[r17,8]
   10a2a:	208a 073e           	mov	r0,-100
   10a2e:	210a 0f80 0001 1538 	mov	r1,0x11538
   10a36:	da00                	mov_s	r2,0
   10a38:	db00                	mov_s	r3,0
   10a3a:	244a 0000           	mov	r4,0
   10a3e:	254a 0000           	mov	r5,0
   10a42:	204a 1e00           	mov	r8,0x38
   10a46:	226f 003f           	trap0
   10a4a:	240a 9000           	mov.f	r12,r0
   10a4e:	017a 0003           	bp	378	;10bc6 <_start+0x342>
   10a52:	200a 0f80 0001 155c 	mov	r0,0x1155c
   10a5a:	0ef6 ff8f           	bl	-2316	;1014c <say>
   10a5e:	200a 0f80 0001 1530 	mov	r0,0x11530
   10a66:	0eea ff8f           	bl	-2328	;1014c <say>
   10a6a:	1200 2001           	ld	r1,[r18]
   10a6e:	d800                	mov_s	r0,0
   10a70:	c285                	add_s	r2,sp,0x14
   10a72:	c041                	st_s	r0,[sp,0x4]
   10a74:	d801                	mov_s	r0,0x1
   10a76:	c042                	st_s	r0,[sp,0x8]
   10a78:	c143                	st_s	r1,[sp,0xc]
   10a7a:	c044                	st_s	r0,[sp,0x10]
   10a7c:	d900                	mov_s	r1,0
   10a7e:	d800                	mov_s	r0,0
   10a80:	c045                	st_s	r0,[sp,0x14]
   10a82:	c146                	st_s	r1,[sp,0x18]
   10a84:	200a 0f80 05f5 e100 	mov	r0,0x5f5e100
   10a8c:	d900                	mov_s	r1,0
   10a8e:	c047                	st_s	r0,[sp,0x1c]
   10a90:	c148                	st_s	r1,[sp,0x20]
   10a92:	c081                	add_s	r0,sp,0x4
   10a94:	d902                	mov_s	r1,0x2
   10a96:	db00                	mov_s	r3,0
   10a98:	244a 0200           	mov	r4,0x8
   10a9c:	254a 0000           	mov	r5,0
   10aa0:	208a 1786           	mov	r8,414
   10aa4:	226f 003f           	trap0
   10aa8:	0871 8012           	brlt	r0,0,-144	;10a18 <_start+0x194>
   10aac:	1412 3100           	ldh	r0,[sp,18]
   10ab0:	b8e0                	btst_s	r0,0
   10ab2:	f217                	beq_s	46	;10ade <_start+0x25a>
   10ab4:	1200 2000           	ld	r0,[r18]
   10ab8:	71e9                	mov_s	r1,r15
   10aba:	da80                	mov_s	r2,0x80
   10abc:	244a 0000           	mov	r4,0
   10ac0:	204a 1fc0           	mov	r8,0x3f
   10ac4:	226f 003f           	trap0
   10ac8:	2052 81fe           	bxor.f	0,r0,0x7
   10acc:	f409                	bne_s	18	;10ade <_start+0x25a>
   10ace:	c015                	ld_s	r0,[sp,0x54]
   10ad0:	0809 03d0           	breq	r0,0xf,8	;10ad8 <_start+0x254>
   10ad4:	080b 0091           	brne	r0,0x2,10	;10ade <_start+0x25a>
   10ad8:	d801                	mov_s	r0,0x1
   10ada:	1908 2000           	st	r0,[r17,8]
   10ade:	78e0                	nop_s
   10ae0:	78e0                	nop_s
   10ae2:	140a 3110           	ldh	r16,[sp,10]
   10ae6:	2044 2050           	and	r16,r16,0x1
   10aea:	0831 a010           	breq	r16,0,-208	;10a18 <_start+0x194>
   10aee:	d800                	mov_s	r0,0
   10af0:	2440 30c1           	add	r1,sp,0x3
   10af4:	da01                	mov_s	r2,0x1
   10af6:	db00                	mov_s	r3,0
   10af8:	244a 0000           	mov	r4,0
   10afc:	254a 0000           	mov	r5,0
   10b00:	204a 1fc0           	mov	r8,0x3f
   10b04:	226f 003f           	trap0
   10b08:	e080                	cmp_s	r0,0
   10b0a:	01c6 0009           	bgt	454	;10cce <_start+0x44a>
   10b0e:	d864                	mov_s	r0,0x64
   10b10:	0dee ff8f           	bl	-2580	;100fc <pause_ms>
   10b14:	f182                	b_s	-252	;10a18 <_start+0x194>
   10b16:	da10                	mov_s	r2,0x10
   10b18:	210a 0f80 0001 24b4 	mov	r1,0x124b4
   10b20:	c081                	add_s	r0,sp,0x4
   10b22:	0d46 ffcf           	bl	-700	;10864 <memcpy>
   10b26:	d900                	mov_s	r1,0
   10b28:	c081                	add_s	r0,sp,0x4
   10b2a:	0f9a ff8f           	bl	-2152	;102c0 <child>
   10b2e:	780b                	tst_s	r0,r0
   10b30:	20ca 0f82 0001 1504 	mov.ne	r0,0x11504
   10b38:	f567                	bne_s	-306	;10a06 <_start+0x182>
   10b3a:	da40                	mov_s	r2,0x40
   10b3c:	210a 0f80 0001 24c4 	mov	r1,0x124c4
   10b44:	70e9                	mov_s	r0,r15
   10b46:	0d22 ffcf           	bl	-736	;10864 <memcpy>
   10b4a:	d901                	mov_s	r1,0x1
   10b4c:	70e9                	mov_s	r0,r15
   10b4e:	0f76 ff8f           	bl	-2188	;102c0 <child>
   10b52:	0882 ffcf           	bl	-1920	;103d0 <ssh_start>
   10b56:	08a2 ffcf           	bl	-1888	;103f4 <https_start>
   10b5a:	0c36 ffcf           	bl	-972	;1078c <load_radio>
   10b5e:	082e ffcf           	bl	-2004	;10388 <radio_country>
   10b62:	1104 2000           	ld	r0,[r17,4]
   10b66:	0829 04d1           	brne	r0,0x13,40	;10b8c <_start+0x308>
   10b6a:	da10                	mov_s	r2,0x10
   10b6c:	210a 0f80 0001 2504 	mov	r1,0x12504
   10b74:	c089                	add_s	r0,sp,0x24
   10b76:	0cf2 ffcf           	bl	-784	;10864 <memcpy>
   10b7a:	d900                	mov_s	r1,0
   10b7c:	c089                	add_s	r0,sp,0x24
   10b7e:	0f46 ff8f           	bl	-2236	;102c0 <child>
   10b82:	780b                	tst_s	r0,r0
   10b84:	20e2 0f81 0001 03ac 	jleq	0x103ac
   10b8c:	da14                	mov_s	r2,0x14
   10b8e:	210a 0f80 0001 2514 	mov	r1,0x12514
   10b96:	c089                	add_s	r0,sp,0x24
   10b98:	0cce ffcf           	bl	-820	;10864 <memcpy>
   10b9c:	d901                	mov_s	r1,0x1
   10b9e:	c089                	add_s	r0,sp,0x24
   10ba0:	0f22 ff8f           	bl	-2272	;102c0 <child>
   10ba4:	da10                	mov_s	r2,0x10
   10ba6:	210a 0f80 0001 2528 	mov	r1,0x12528
   10bae:	c085                	add_s	r0,sp,0x14
   10bb0:	0cb6 ffcf           	bl	-844	;10864 <memcpy>
   10bb4:	d901                	mov_s	r1,0x1
   10bb6:	c085                	add_s	r0,sp,0x14
   10bb8:	0f0a ff8f           	bl	-2296	;102c0 <child>
   10bbc:	200a 0f80 0001 151c 	mov	r0,0x1151c
   10bc4:	f121                	b_s	-446	;10a06 <_start+0x182>
   10bc6:	71e9                	mov_s	r1,r15
   10bc8:	da1f                	mov_s	r2,0x1f
   10bca:	204a 1fc0           	mov	r8,0x3f
   10bce:	226f 003f           	trap0
   10bd2:	da00                	mov_s	r2,0
   10bd4:	7508                	mov_s	r13,r0
   10bd6:	7189                	mov_s	r1,r12
   10bd8:	d839                	mov_s	r0,0x39
   10bda:	0d0e ff8f           	bl	-2804	;100e4 <syscall6.constprop.0.isra.0>
   10bde:	e580                	cmp_s	r13,0
   10be0:	0672 ffcc           	ble	-398	;10a52 <_start+0x1ce>
   10be4:	67bd                	add_s	r13,r15,r13
   10be6:	210a 0f80 0001 157c 	mov	r1,0x1157c
   10bee:	70e9                	mov_s	r0,r15
   10bf0:	1d00 1402           	stb	r16,[r13]
   10bf4:	0ca2 ff8f           	bl	-2912	;10094 <eq>
   10bf8:	780b                	tst_s	r0,r0
   10bfa:	20ca 0f81 0001 1594 	mov.eq	r0,0x11594
   10c02:	f32d                	beq_s	-422	;10a5a <_start+0x1d6>
   10c04:	200a 0f80 0001 15b0 	mov	r0,0x115b0
   10c0c:	0d42 ff8f           	bl	-2752	;1014c <say>
   10c10:	244a 0000           	mov	r4,0
   10c14:	db00                	mov_s	r3,0
   10c16:	da0f                	mov_s	r2,0xf
   10c18:	218a 0fff           	mov	r1,-1
   10c1c:	d881                	mov_s	r0,0x81
   10c1e:	dd00                	mov_s	r13,0
   10c20:	0cc6 ff8f           	bl	-2876	;100e4 <syscall6.constprop.0.isra.0>
   10c24:	d864                	mov_s	r0,0x64
   10c26:	0cda ff8f           	bl	-2856	;100fc <pause_ms>
   10c2a:	6da1                	add_s	r13,r13,0x1
   10c2c:	0c92 ff8f           	bl	-2928	;100bc <reap>
   10c30:	0df5 9511           	brne	r13,0x14,-12	;10c24 <_start+0x3a0>
   10c34:	244a 0000           	mov	r4,0
   10c38:	db00                	mov_s	r3,0
   10c3a:	da09                	mov_s	r2,0x9
   10c3c:	218a 0fff           	mov	r1,-1
   10c40:	d881                	mov_s	r0,0x81
   10c42:	0ca6 ff8f           	bl	-2908	;100e4 <syscall6.constprop.0.isra.0>
   10c46:	d864                	mov_s	r0,0x64
   10c48:	0cb6 ff8f           	bl	-2892	;100fc <pause_ms>
   10c4c:	0c72 ff8f           	bl	-2960	;100bc <reap>
   10c50:	da10                	mov_s	r2,0x10
   10c52:	210a 0f80 0001 2538 	mov	r1,0x12538
   10c5a:	c085                	add_s	r0,sp,0x14
   10c5c:	0c0a ffcf           	bl	-1016	;10864 <memcpy>
   10c60:	d900                	mov_s	r1,0
   10c62:	c085                	add_s	r0,sp,0x14
   10c64:	0e5e ff8f           	bl	-2468	;102c0 <child>
   10c68:	e807                	breq_s	r0,0,14	;10c76 <_start+0x3f2>
   10c6a:	200a 0f80 0001 15c8 	mov	r0,0x115c8
   10c72:	05eb ffcf           	b	-534	;10a5a <_start+0x1d6>
   10c76:	244a 0000           	mov	r4,0
   10c7a:	db00                	mov_s	r3,0
   10c7c:	da00                	mov_s	r2,0
   10c7e:	d900                	mov_s	r1,0
   10c80:	d851                	mov_s	r0,0x51
   10c82:	0c66 ff8f           	bl	-2972	;100e4 <syscall6.constprop.0.isra.0>
   10c86:	200a 0f80 0001 15ec 	mov	r0,0x115ec
   10c8e:	0cc2 ff8f           	bl	-2880	;1014c <say>
   10c92:	200a 0f80 fee1 dead 	mov	r0,0xfee1dead
   10c9a:	210a 0f80 2812 1969 	mov	r1,0x28121969
   10ca2:	220a 0f80 0123 4567 	mov	r2,0x1234567
   10caa:	db00                	mov_s	r3,0
   10cac:	244a 0000           	mov	r4,0
   10cb0:	254a 0000           	mov	r5,0
   10cb4:	208a 1382           	mov	r8,142
   10cb8:	226f 003f           	trap0
   10cbc:	7108                	mov_s	r1,r0
   10cbe:	200a 0f80 0001 1600 	mov	r0,0x11600
   10cc6:	0d32 ff8f           	bl	-2768	;101f4 <report>
   10cca:	0597 ffcf           	b	-618	;10a5e <_start+0x1da>
   10cce:	1403 3080           	ldb	r0,[sp,3]
   10cd2:	0823 0290           	breq	r0,0xa,34	;10cf2 <_start+0x46e>
   10cd6:	081f 0350           	breq	r0,0xd,30	;10cf2 <_start+0x46e>
   10cda:	e6ae                	cmp_s	r14,0x2e
   10cdc:	053c ffcd           	bhi	-708	;10a18 <_start+0x194>
   10ce0:	2655 1d41           	add2	r1,r14,0x35
   10ce4:	2100 0701           	add	r1,r1,sp
   10ce8:	1950 8002           	stb	r0,[r1,-176]
   10cec:	6ec1                	add_s	r14,r14,0x1
   10cee:	052d ffcf           	b	-724	;10a18 <_start+0x194>
   10cf2:	c589                	add_s	r13,sp,0x24
   10cf4:	d800                	mov_s	r0,0
   10cf6:	65de                	add_s	r14,r13,r14
   10cf8:	ae00                	stb_s	r0,[r14,0]
   10cfa:	210a 0f80 0001 1614 	mov	r1,0x11614
   10d02:	70a9                	mov_s	r0,r13
   10d04:	0b92 ff8f           	bl	-3184	;10094 <eq>
   10d08:	e80f                	breq_s	r0,0,30	;10d26 <_start+0x4a2>
   10d0a:	200a 0f80 0001 14a4 	mov	r0,0x114a4
   10d12:	0d12 ff8f           	bl	-2800	;10220 <cat>
   10d16:	200a 0f80 0001 161c 	mov	r0,0x1161c
   10d1e:	0d06 ff8f           	bl	-2812	;10220 <cat>
   10d22:	04eb ffcf           	b	-790	;10a0a <_start+0x186>
   10d26:	210a 0f80 0001 162c 	mov	r1,0x1162c
   10d2e:	70a9                	mov_s	r0,r13
   10d30:	0b66 ff8f           	bl	-3228	;10094 <eq>
   10d34:	e806                	breq_s	r0,0,12	;10d40 <_start+0x4bc>
   10d36:	200a 0f80 0001 1638 	mov	r0,0x11638
   10d3e:	f1f1                	b_s	-30	;10d1e <_start+0x49a>
   10d40:	210a 0f80 0001 164c 	mov	r1,0x1164c
   10d48:	70a9                	mov_s	r0,r13
   10d4a:	0b4e ff8f           	bl	-3252	;10094 <eq>
   10d4e:	780b                	tst_s	r0,r0
   10d50:	20ca 0f82 0001 1654 	mov.ne	r0,0x11654
   10d58:	f5e3                	bne_s	-58	;10d1e <_start+0x49a>
   10d5a:	210a 0f80 0001 1664 	mov	r1,0x11664
   10d62:	70a9                	mov_s	r0,r13
   10d64:	0b32 ff8f           	bl	-3280	;10094 <eq>
   10d68:	0895 0010           	breq	r0,0,148	;10dfc <_start+0x578>
   10d6c:	d800                	mov_s	r0,0
   10d6e:	210a 0f80 0001 45dc 	mov	r1,0x145dc
   10d76:	2007 0f83 5a3c 96e1 	xor	r3,r0,0x5a3c96e1
   10d7e:	2115 0002           	add2	r2,r1,r0
   10d82:	a260                	st_s	r3,[r2,0]
   10d84:	6801                	add_s	r0,r0,0x1
   10d86:	08eb 8f81 0004 0000 	brne	r0,0x40000,-22	;10d6e <_start+0x4ea>
   10d8e:	d800                	mov_s	r0,0
   10d90:	2115 0002           	add2	r2,r1,r0
   10d94:	8260                	ld_s	r3,[r2,0]
   10d96:	2007 0f82 5a3c 96e1 	xor	r2,r0,0x5a3c96e1
   10d9e:	0b13 0080           	breq	r3,r2,18	;10dae <_start+0x52a>
   10da2:	200a 0f80 0001 166c 	mov	r0,0x1166c
   10daa:	045f ffcf           	b	-930	;10a06 <_start+0x182>
   10dae:	6801                	add_s	r0,r0,0x1
   10db0:	08e1 8f81 0004 0000 	brne	r0,0x40000,-32	;10d90 <_start+0x50c>
   10db8:	d800                	mov_s	r0,0
   10dba:	2007 0f83 a5c3 691e 	xor	r3,r0,0xa5c3691e
   10dc2:	2115 0002           	add2	r2,r1,r0
   10dc6:	a260                	st_s	r3,[r2,0]
   10dc8:	6801                	add_s	r0,r0,0x1
   10dca:	08f3 8f81 0004 0000 	brne	r0,0x40000,-14	;10dba <_start+0x536>
   10dd2:	d800                	mov_s	r0,0
   10dd4:	2115 0002           	add2	r2,r1,r0
   10dd8:	8260                	ld_s	r3,[r2,0]
   10dda:	2007 0f82 a5c3 691e 	xor	r2,r0,0xa5c3691e
   10de2:	0bc3 8081           	brne	r3,r2,-62	;10da2 <_start+0x51e>
   10de6:	6801                	add_s	r0,r0,0x1
   10de8:	08ed 8f81 0004 0000 	brne	r0,0x40000,-20	;10dd4 <_start+0x550>
   10df0:	200a 0f80 0001 167c 	mov	r0,0x1167c
   10df8:	040f ffcf           	b	-1010	;10a06 <_start+0x182>
   10dfc:	210a 0f80 0001 169c 	mov	r1,0x1169c
   10e04:	70a9                	mov_s	r0,r13
   10e06:	0a92 ff8f           	bl	-3440	;10094 <eq>
   10e0a:	e806                	breq_s	r0,0,12	;10e14 <_start+0x590>
   10e0c:	0e0e ff8f           	bl	-2548	;10418 <load_driver>
   10e10:	03fb ffcf           	b	-1030	;10a0a <_start+0x186>
   10e14:	210a 0f80 0001 16a4 	mov	r1,0x116a4
   10e1c:	70a9                	mov_s	r0,r13
   10e1e:	0a7a ff8f           	bl	-3464	;10094 <eq>
   10e22:	780b                	tst_s	r0,r0
   10e24:	20ca 0f82 0001 16ac 	mov.ne	r0,0x116ac
   10e2c:	f579                	bne_s	-270	;10d1e <_start+0x49a>
   10e2e:	210a 0f80 0001 16bc 	mov	r1,0x116bc
   10e36:	70a9                	mov_s	r0,r13
   10e38:	0a5e ff8f           	bl	-3492	;10094 <eq>
   10e3c:	780b                	tst_s	r0,r0
   10e3e:	21ca 0062           	mov.ne	r1,0x1
   10e42:	f40b                	bne_s	22	;10e56 <_start+0x5d2>
   10e44:	210a 0f80 0001 16c4 	mov	r1,0x116c4
   10e4c:	70a9                	mov_s	r0,r13
   10e4e:	0a4a ff8f           	bl	-3512	;10094 <eq>
   10e52:	e808                	breq_s	r0,0,16	;10e60 <_start+0x5dc>
   10e54:	d900                	mov_s	r1,0
   10e56:	d800                	mov_s	r0,0
   10e58:	0e5e ff8f           	bl	-2468	;104b4 <iface>
   10e5c:	03af ffcf           	b	-1106	;10a0a <_start+0x186>
   10e60:	210a 0f80 0001 16d0 	mov	r1,0x116d0
   10e68:	70a9                	mov_s	r0,r13
   10e6a:	0a2e ff8f           	bl	-3540	;10094 <eq>
   10e6e:	780b                	tst_s	r0,r0
   10e70:	21ca 0062           	mov.ne	r1,0x1
   10e74:	f40a                	bne_s	20	;10e88 <_start+0x604>
   10e76:	210a 0f80 0001 16d8 	mov	r1,0x116d8
   10e7e:	70a9                	mov_s	r0,r13
   10e80:	0a16 ff8f           	bl	-3564	;10094 <eq>
   10e84:	e804                	breq_s	r0,0,8	;10e8c <_start+0x608>
   10e86:	d900                	mov_s	r1,0
   10e88:	d801                	mov_s	r0,0x1
   10e8a:	f1e8                	b_s	-48	;10e58 <_start+0x5d4>
   10e8c:	210a 0f80 0001 16e4 	mov	r1,0x116e4
   10e94:	70a9                	mov_s	r0,r13
   10e96:	0a02 ff8f           	bl	-3584	;10094 <eq>
   10e9a:	780b                	tst_s	r0,r0
   10e9c:	20ca 0f82 0001 16f0 	mov.ne	r0,0x116f0
   10ea4:	f53d                	bne_s	-390	;10d1e <_start+0x49a>
   10ea6:	210a 0f80 0001 1700 	mov	r1,0x11700
   10eae:	70a9                	mov_s	r0,r13
   10eb0:	09e6 ff8f           	bl	-3612	;10094 <eq>
   10eb4:	780b                	tst_s	r0,r0
   10eb6:	20ca 0f82 0001 170c 	mov.ne	r0,0x1170c
   10ebe:	f531                	bne_s	-414	;10d1e <_start+0x49a>
   10ec0:	210a 0f80 0001 1738 	mov	r1,0x11738
   10ec8:	70a9                	mov_s	r0,r13
   10eca:	09ce ff8f           	bl	-3636	;10094 <eq>
   10ece:	780b                	tst_s	r0,r0
   10ed0:	20ca 0f82 0001 1744 	mov.ne	r0,0x11744
   10ed8:	f523                	bne_s	-442	;10d1e <_start+0x49a>
   10eda:	210a 0f80 0001 1770 	mov	r1,0x11770
   10ee2:	70a9                	mov_s	r0,r13
   10ee4:	09b2 ff8f           	bl	-3664	;10094 <eq>
   10ee8:	e812                	breq_s	r0,0,36	;10f0c <_start+0x688>
   10eea:	d800                	mov_s	r0,0
   10eec:	0f46 ff8f           	bl	-2236	;10630 <address_status>
   10ef0:	d801                	mov_s	r0,0x1
   10ef2:	0f42 ff8f           	bl	-2240	;10630 <address_status>
   10ef6:	200a 0f80 0001 1778 	mov	r0,0x11778
   10efe:	0b26 ff8f           	bl	-3292	;10220 <cat>
   10f02:	200a 0f80 0001 1788 	mov	r0,0x11788
   10f0a:	f10b                	b_s	-490	;10d1e <_start+0x49a>
   10f0c:	210a 0f80 0001 179c 	mov	r1,0x1179c
   10f14:	70a9                	mov_s	r0,r13
   10f16:	0982 ff8f           	bl	-3712	;10094 <eq>
   10f1a:	e80e                	breq_s	r0,0,28	;10f34 <_start+0x6b0>
   10f1c:	200a 0f80 0001 17a8 	mov	r0,0x117a8
   10f24:	0afe ff8f           	bl	-3332	;10220 <cat>
   10f28:	200a 0f80 0001 17c4 	mov	r0,0x117c4
   10f30:	05ef ffcf           	b	-530	;10d1e <_start+0x49a>
   10f34:	210a 0f80 0001 17e4 	mov	r1,0x117e4
   10f3c:	70a9                	mov_s	r0,r13
   10f3e:	095a ff8f           	bl	-3752	;10094 <eq>
   10f42:	e80e                	breq_s	r0,0,28	;10f5c <_start+0x6d8>
   10f44:	200a 0f80 0001 17f0 	mov	r0,0x117f0
   10f4c:	0ad6 ff8f           	bl	-3372	;10220 <cat>
   10f50:	200a 0f80 0001 180c 	mov	r0,0x1180c
   10f58:	05c7 ffcf           	b	-570	;10d1e <_start+0x49a>
   10f5c:	210a 0f80 0001 182c 	mov	r1,0x1182c
   10f64:	70a9                	mov_s	r0,r13
   10f66:	0932 ff8f           	bl	-3792	;10094 <eq>
   10f6a:	780b                	tst_s	r0,r0
   10f6c:	20ca 0f82 0001 1838 	mov.ne	r0,0x11838
   10f74:	05aa ffc2           	bne	-598	;10d1e <_start+0x49a>
   10f78:	210a 0f80 0001 1860 	mov	r1,0x11860
   10f80:	70a9                	mov_s	r0,r13
   10f82:	0916 ff8f           	bl	-3820	;10094 <eq>
   10f86:	780b                	tst_s	r0,r0
   10f88:	20ca 0f82 0001 186c 	mov.ne	r0,0x1186c
   10f90:	058e ffc2           	bne	-626	;10d1e <_start+0x49a>
   10f94:	210a 0f80 0001 1894 	mov	r1,0x11894
   10f9c:	70a9                	mov_s	r0,r13
   10f9e:	08fa ff8f           	bl	-3848	;10094 <eq>
   10fa2:	e806                	breq_s	r0,0,12	;10fac <_start+0x728>
   10fa4:	0fea ff8f           	bl	-2072	;1078c <load_radio>
   10fa8:	0263 ffcf           	b	-1438	;10a0a <_start+0x186>
   10fac:	210a 0f80 0001 18a0 	mov	r1,0x118a0
   10fb4:	70a9                	mov_s	r0,r13
   10fb6:	08e2 ff8f           	bl	-3872	;10094 <eq>
   10fba:	780b                	tst_s	r0,r0
   10fbc:	22ca 0522           	mov.ne	r2,0x14
   10fc0:	21ca 0f82 0001 2548 	mov.ne	r1,0x12548
   10fc8:	f41a                	bne_s	52	;10ffc <_start+0x778>
   10fca:	210a 0f80 0001 18ac 	mov	r1,0x118ac
   10fd2:	70a9                	mov_s	r0,r13
   10fd4:	08c2 ff8f           	bl	-3904	;10094 <eq>
   10fd8:	e81b                	breq_s	r0,0,54	;1100e <_start+0x78a>
   10fda:	da0c                	mov_s	r2,0xc
   10fdc:	210a 0f80 0001 255c 	mov	r1,0x1255c
   10fe4:	c085                	add_s	r0,sp,0x14
   10fe6:	0882 ffcf           	bl	-1920	;10864 <memcpy>
   10fea:	d900                	mov_s	r1,0
   10fec:	c085                	add_s	r0,sp,0x14
   10fee:	0ad6 ff8f           	bl	-3372	;102c0 <child>
   10ff2:	da10                	mov_s	r2,0x10
   10ff4:	210a 0f80 0001 2568 	mov	r1,0x12568
   10ffc:	c095                	add_s	r0,sp,0x54
   10ffe:	086a ffcf           	bl	-1944	;10864 <memcpy>
   11002:	d900                	mov_s	r1,0
   11004:	c095                	add_s	r0,sp,0x54
   11006:	0abe ff8f           	bl	-3396	;102c0 <child>
   1100a:	0203 ffcf           	b	-1534	;10a0a <_start+0x186>
   1100e:	210a 0f80 0001 18b8 	mov	r1,0x118b8
   11016:	70a9                	mov_s	r0,r13
   11018:	087e ff8f           	bl	-3972	;10094 <eq>
   1101c:	e805                	breq_s	r0,0,10	;11026 <_start+0x7a2>
   1101e:	0b6e ff8f           	bl	-3220	;10388 <radio_country>
   11022:	01eb ffcf           	b	-1558	;10a0a <_start+0x186>
   11026:	210a 0f80 0001 18c0 	mov	r1,0x118c0
   1102e:	70a9                	mov_s	r0,r13
   11030:	0866 ff8f           	bl	-3996	;10094 <eq>
   11034:	e805                	breq_s	r0,0,10	;1103e <_start+0x7ba>
   11036:	0b7a ff8f           	bl	-3208	;103ac <radio_ap>
   1103a:	01d3 ffcf           	b	-1582	;10a0a <_start+0x186>
   1103e:	210a 0f80 0001 18c8 	mov	r1,0x118c8
   11046:	70a9                	mov_s	r0,r13
   11048:	084e ff8f           	bl	-4020	;10094 <eq>
   1104c:	780b                	tst_s	r0,r0
   1104e:	22ca 0522           	mov.ne	r2,0x14
   11052:	21ca 0f82 0001 2578 	mov.ne	r1,0x12578
   1105a:	f5d2                	bne_s	-92	;10ffc <_start+0x778>
   1105c:	210a 0f80 0001 18d4 	mov	r1,0x118d4
   11064:	70a9                	mov_s	r0,r13
   11066:	0832 ff8f           	bl	-4048	;10094 <eq>
   1106a:	e806                	breq_s	r0,0,12	;11074 <_start+0x7f0>
   1106c:	0b66 ff8f           	bl	-3228	;103d0 <ssh_start>
   11070:	019b ffcf           	b	-1638	;10a0a <_start+0x186>
   11074:	210a 0f80 0001 18e0 	mov	r1,0x118e0
   1107c:	70a9                	mov_s	r0,r13
   1107e:	081a ff8f           	bl	-4072	;10094 <eq>
   11082:	e806                	breq_s	r0,0,12	;1108c <_start+0x808>
   11084:	0b72 ff8f           	bl	-3216	;103f4 <https_start>
   11088:	0183 ffcf           	b	-1662	;10a0a <_start+0x186>
   1108c:	210a 0f80 0001 18ec 	mov	r1,0x118ec
   11094:	70a9                	mov_s	r0,r13
   11096:	0802 ff8f           	bl	-4096	;10094 <eq>
   1109a:	780b                	tst_s	r0,r0
   1109c:	22ca 0522           	mov.ne	r2,0x14
   110a0:	21ca 0f82 0001 258c 	mov.ne	r1,0x1258c
   110a8:	f5aa                	bne_s	-172	;10ffc <_start+0x778>
   110aa:	210a 0f80 0001 18fc 	mov	r1,0x118fc
   110b2:	70a9                	mov_s	r0,r13
   110b4:	0fe2 ff4f           	bl	-4128	;10094 <eq>
   110b8:	780b                	tst_s	r0,r0
   110ba:	22ca 0822           	mov.ne	r2,0x20
   110be:	21ca 0f82 0001 25a0 	mov.ne	r1,0x125a0
   110c6:	f59c                	bne_s	-200	;10ffc <_start+0x778>
   110c8:	210a 0f80 0001 1904 	mov	r1,0x11904
   110d0:	70a9                	mov_s	r0,r13
   110d2:	0fc6 ff4f           	bl	-4156	;10094 <eq>
   110d6:	e808                	breq_s	r0,0,16	;110e4 <_start+0x860>
   110d8:	da0c                	mov_s	r2,0xc
   110da:	210a 0f80 0001 25c0 	mov	r1,0x125c0
   110e2:	f18e                	b_s	-228	;10ffc <_start+0x778>
   110e4:	210a 0f80 0001 190c 	mov	r1,0x1190c
   110ec:	70a9                	mov_s	r0,r13
   110ee:	0faa ff4f           	bl	-4184	;10094 <eq>
   110f2:	780b                	tst_s	r0,r0
   110f4:	20ca 0f82 0001 1914 	mov.ne	r0,0x11914
   110fc:	0422 ffc2           	bne	-990	;10d1e <_start+0x49a>
   11100:	210a 0f80 0001 1924 	mov	r1,0x11924
   11108:	70a9                	mov_s	r0,r13
   1110a:	0f8e ff4f           	bl	-4212	;10094 <eq>
   1110e:	e824                	breq_s	r0,0,72	;11154 <_start+0x8d0>
   11110:	d901                	mov_s	r1,0x1
   11112:	1e00 7040 0001 45d8 	st	r1,[0x145d8]
   1111a:	00f3 ffcf           	b	-1806	;10a0a <_start+0x186>
   1111e:	6801                	add_s	r0,r0,0x1
   11120:	c589                	add_s	r13,sp,0x24
   11122:	6519                	add_s	r1,r13,r0
   11124:	8920                	ldb_s	r1,[r1,0]
   11126:	e9fd                	brne_s	r1,0,-6	;1111e <_start+0x89a>
   11128:	0881 0194           	brlo	r0,0x6,128	;111a8 <_start+0x924>
   1112c:	c029                	ldb_s	r0,[sp,0x24]
   1112e:	e0e5                	cmp_s	r0,0x65
   11130:	f43c                	bne_s	120	;111a8 <_start+0x924>
   11132:	1425 3080           	ldb	r0,[sp,37]
   11136:	e0e3                	cmp_s	r0,0x63
   11138:	f438                	bne_s	112	;111a8 <_start+0x924>
   1113a:	1426 3080           	ldb	r0,[sp,38]
   1113e:	e0e8                	cmp_s	r0,0x68
   11140:	f434                	bne_s	104	;111a8 <_start+0x924>
   11142:	1427 3080           	ldb	r0,[sp,39]
   11146:	e0ef                	cmp_s	r0,0x6f
   11148:	f430                	bne_s	96	;111a8 <_start+0x924>
   1114a:	c02a                	ldb_s	r0,[sp,0x28]
   1114c:	085d 0811           	brne	r0,0x20,92	;111a8 <_start+0x924>
   11150:	d905                	mov_s	r1,0x5
   11152:	f016                	b_s	44	;1117c <_start+0x8f8>
   11154:	d800                	mov_s	r0,0
   11156:	f1e6                	b_s	-52	;11120 <_start+0x89c>
   11158:	2004 0f82 0000 00df 	and	r2,r0,0xdf
   11160:	2280 0ffe           	add	r2,r2,-65
   11164:	6921                	add_s	r1,r1,0x1
   11166:	0a19 0694           	brlo	r2,0x1a,24	;1117c <_start+0x8f8>
   1116a:	2059 0182           	sub3	r2,r0,0x6
   1116e:	0a11 0294           	brlo	r2,0xa,16	;1117c <_start+0x8f8>
   11172:	e0ad                	cmp_s	r0,0x2d
   11174:	d801                	mov_s	r0,0x1
   11176:	78c0                	sub_s.ne	r0,r0,r0
   11178:	2004 2010           	and	r16,r16,r0
   1117c:	6538                	add_s	r0,r13,r1
   1117e:	8800                	ldb_s	r0,[r0,0]
   11180:	e8ec                	brne_s	r0,0,-40	;11158 <_start+0x8d4>
   11182:	200b a400           	tst	r16,r16
   11186:	0086 ffc1           	beq	-1914	;10a0a <_start+0x186>
   1118a:	200a 0f80 0001 192c 	mov	r0,0x1192c
   11192:	0fbe ff4f           	bl	-4164	;1014c <say>
   11196:	6d05                	add_s	r0,r13,0x5
   11198:	0fb6 ff4f           	bl	-4172	;1014c <say>
   1119c:	200a 0f80 0001 142c 	mov	r0,0x1142c
   111a4:	0063 ffcf           	b	-1950	;10a06 <_start+0x182>
   111a8:	200a 0f80 0001 193c 	mov	r0,0x1193c
   111b0:	0057 ffcf           	b	-1962	;10a06 <_start+0x182>

000111b4 <__divsi3>:
   111b4:	240a 17c0           	mov	r12,blink
   111b8:	2007 004b           	xor	r11,r0,r1
   111bc:	7811                	abs_s	r0,r0
   111be:	082e 0020           	bl.d	44	;111e8 <__udivmodsi4>
   111c2:	7931                	abs_s	r1,r1
   111c4:	230b 92c0           	tst	r11,r11
   111c8:	2021 0300           	j.d	[r12]
   111cc:	20ce 0024           	neg.n	r0,r0

000111d0 <__modsi3>:
   111d0:	74eb                	mov_s	r12,blink
   111d2:	7079                	mov_s	r11,r0
   111d4:	7811                	abs_s	r0,r0
   111d6:	0816 0020           	bl.d	20	;111e8 <__udivmodsi4>
   111da:	7931                	abs_s	r1,r1
   111dc:	230b 92c0           	tst	r11,r11
   111e0:	7833                	neg_s	r0,r1
   111e2:	7c20                	j_s.d	[r12]
   111e4:	20ca 0043           	mov.p	r0,r1

000111e8 <__udivmodsi4>:
   111e8:	7a1d                	lsr_s	r2,r0
   111ea:	0955 00a5           	brhs.d	r1,r2,84	;1123c <__udivmodsi4+0x54>
   111ee:	2a2f 0081           	norm	r2,r2
   111f2:	2b2f 0041           	norm	r3,r1
   111f6:	7b42                	sub_s	r3,r3,r2
   111f8:	7978                	asl_s	r1,r1,r3
   111fa:	2017 807e           	sub1.f	0,r0,r1
   111fe:	29c1 0065           	lsr.c	r1,r1,0x1
   11202:	2343 0002           	sbc	r2,r3,0
   11206:	2017 0040           	sub1	r0,r0,r1
   1120a:	7030                	cmp_s	r0,r1
   1120c:	240a f080           	mov.f	lp_count,r2
   11210:	20c2 0046           	sub.nc	r0,r0,r1
   11214:	db03                	mov_s	r3,0x3
   11216:	2343 0003           	sbc	r3,r3,0
   1121a:	7b58                	asl_s	r3,r3,r2
   1121c:	214e 0041           	rsub	r1,r1,0x1
   11220:	20e8 01a2           	lpne	0xc	;1122c <__udivmodsi4+0x44>
   11224:	2114 8000           	add1.f	r0,r1,r0
   11228:	20c2 0046           	sub.nc	r0,r0,r1
   1122c:	2801 0081           	lsr	r1,r0,r2
   11230:	2013 0080           	bmsk	r0,r0,r2
   11234:	2010 0080           	bclr	r0,r0,r2
   11238:	7fe0                	j_s.d	[blink]
   1123a:	7865                	or_s	r0,r0,r3
   1123c:	7198                	mov_s	r4,r1
   1123e:	2002 8041           	sub.f	r1,r0,r1
   11242:	2003 0000           	sbc	r0,r0,r0
   11246:	21c2 8106           	sub.f.nc	r1,r1,r4
   1124a:	2043 0000           	sbc	r0,r0,0
   1124e:	21c2 8106           	sub.f.nc	r1,r1,r4
   11252:	2083 0f7f           	sbc	r0,r0,-3
   11256:	7fe0                	j_s.d	[blink]
   11258:	21c0 0105           	add.c	r1,r1,r4
