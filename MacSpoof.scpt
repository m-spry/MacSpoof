FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ys Mac Address Spoofer v0.4, 
an automated mac spoofer that uses built in OS X terminal commands 

Changelog
-----------
0.4
- Slightly improved UI
- Removed lists in favour of dialog boxes
- Added names to en0 (wifi) / en1 (ethernet)
- Added comments for whats happening in the script
- Cleaned up script

0.3
- Added choice for automatic spoofing or choosing your own address to spoof
- Shows old mac address and new mac address at the end.

0.2.1
- Added to git

0.2
- Added support for en1 (ethernet) and en0 (wifi)

0.1
- First Version
- Very basic, not idiot proof... yet
- Only works with Wi-Fi as of now

http://licence.visualidiot.com

Basically, you�re free to do what you want with it; as long as you do something good (help someone out, smile; just be nice), you can use this on anything you fancy. Of course, if it all breaks, it�s totally not the author�s fault. Enjoy!

     � 	 	�   M a c   A d d r e s s   S p o o f e r   v 0 . 4 ,   
 a n   a u t o m a t e d   m a c   s p o o f e r   t h a t   u s e s   b u i l t   i n   O S   X   t e r m i n a l   c o m m a n d s   
 
 C h a n g e l o g 
 - - - - - - - - - - - 
 0 . 4 
 -   S l i g h t l y   i m p r o v e d   U I 
 -   R e m o v e d   l i s t s   i n   f a v o u r   o f   d i a l o g   b o x e s 
 -   A d d e d   n a m e s   t o   e n 0   ( w i f i )   /   e n 1   ( e t h e r n e t ) 
 -   A d d e d   c o m m e n t s   f o r   w h a t s   h a p p e n i n g   i n   t h e   s c r i p t 
 -   C l e a n e d   u p   s c r i p t 
 
 0 . 3 
 -   A d d e d   c h o i c e   f o r   a u t o m a t i c   s p o o f i n g   o r   c h o o s i n g   y o u r   o w n   a d d r e s s   t o   s p o o f 
 -   S h o w s   o l d   m a c   a d d r e s s   a n d   n e w   m a c   a d d r e s s   a t   t h e   e n d . 
 
 0 . 2 . 1 
 -   A d d e d   t o   g i t 
 
 0 . 2 
 -   A d d e d   s u p p o r t   f o r   e n 1   ( e t h e r n e t )   a n d   e n 0   ( w i f i ) 
 
 0 . 1 
 -   F i r s t   V e r s i o n 
 -   V e r y   b a s i c ,   n o t   i d i o t   p r o o f . . .   y e t 
 -   O n l y   w o r k s   w i t h   W i - F i   a s   o f   n o w 
 
 h t t p : / / l i c e n c e . v i s u a l i d i o t . c o m 
 
 B a s i c a l l y ,   y o u  r e   f r e e   t o   d o   w h a t   y o u   w a n t   w i t h   i t ;   a s   l o n g   a s   y o u   d o   s o m e t h i n g   g o o d   ( h e l p   s o m e o n e   o u t ,   s m i l e ;   j u s t   b e   n i c e ) ,   y o u   c a n   u s e   t h i s   o n   a n y t h i n g   y o u   f a n c y .   O f   c o u r s e ,   i f   i t   a l l   b r e a k s ,   i t  s   t o t a l l y   n o t   t h e   a u t h o r  s   f a u l t .   E n j o y ! 
 
   
  
 l     ��������  ��  ��        l     ����  I    ��  
�� .sysodlogaskr        TEXT  b         b         b         m        �  � T h e   w o r k   i s   p r o v i d e d    a s   i s  ,   w i t h o u t   w a r r a n t y   o r   s u p p o r t ,   e x p r e s s   o r   i m p l i e d .   T h e   a u t h o r ( s )   a r e   n o t   l i a b l e   f o r   a n y   d a m a g e s ,   m i s u s e ,   o r   o t h e r   c l a i m ,   w h e t h e r   f r o m   o r   a s   a   c o n s e q u e n c e   o f   u s a g e   o f   t h e   g i v e n   w o r k .  o    ��
�� 
ret   o    ��
�� 
ret   m       �   F W i t h   t h a t   s a i d   p r e s s   O K   t o   c o n t i n u e  �� ��
�� 
appr  m    	   �    D i s c l a i m e r��  ��  ��        l     ��������  ��  ��       !   l   < "���� " Z    < # $�� % # =    & ' & n     ( ) ( 1    ��
�� 
bhit ) l    *���� * I   �� + ,
�� .sysodlogaskr        TEXT + m     - - � . . F C h o o s e   w h a t   y o u   w o u l d   l i k e   t o   s p o o f , �� / 0
�� 
btns / J     1 1  2 3 2 m     4 4 � 5 5 
 W i - F i 3  6�� 6 m     7 7 � 8 8  E t h e r n e t��   0 �� 9��
�� 
appr 9 m     : : � ; ;  M a c S p o o f��  ��  ��   ' m     < < � = = 
 W i - F i $ k   ! , > >  ? @ ? r   ! $ A B A m   ! " C C � D D  e n 1 B o      ���� 0 network   @  E�� E r   % , F G F m   % ( H H � I I 
 W i - F i G o      ���� 0 networkchoice networkChoice��  ��   % k   / < J J  K L K r   / 4 M N M m   / 2 O O � P P  e n 0 N o      ���� 0 network   L  Q�� Q r   5 < R S R m   5 8 T T � U U  E t h e r n e t S o      ���� 0 networkchoice networkChoice��  ��  ��   !  V W V l     ��������  ��  ��   W  X�� X l  =� Y���� Y Z   =� Z [�� \ Z =  = W ] ^ ] n   = S _ ` _ 1   Q S��
�� 
bhit ` l  = Q a���� a I  = Q�� b c
�� .sysodlogaskr        TEXT b m   = @ d d � e e H C h o o s e   h o w   t o   s p o o f   y o u r   M a c   A d d r e s s c �� f g
�� 
btns f J   A I h h  i j i m   A D k k � l l  R a n d o m i z e j  m�� m m   D G n n � o o  C h o o s e��   g �� p��
�� 
appr p m   J M q q � r r  M a c S p o o f��  ��  ��   ^ m   S V s s � t t  R a n d o m i z e [ k   Z] u u  v w v l   Z Z�� x y��   x 4 . Get the old Mac Address for confirmation msg     y � z z \   G e t   t h e   o l d   M a c   A d d r e s s   f o r   c o n f i r m a t i o n   m s g   w  { | { O  Z n } ~ } I  ` m�� ��
�� .sysoexecTEXT���     TEXT  b   ` i � � � b   ` e � � � m   ` c � � � � �  i f c o n f i g   � o   c d���� 0 network   � m   e h � � � � �    | g r e p   e t h e r��   ~ m   Z ] � ��                                                                                      @ alis    Z  Mac HD                     �j��H+     \Terminal.app                                                     $���g        ����  	                	Utilities     �kc      ���       \   [  ,Mac HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c   H D  #Applications/Utilities/Terminal.app   / ��   |  � � � r   o v � � � 1   o r��
�� 
rslt � o      ���� 0 oldmacad   �  � � � l  w w��������  ��  ��   �  � � � l   w w�� � ���   � � � The Worlds LAZIEST working Mac Address randomizer
	Basically, generates 6 hex parts then glues them together
	and takes the glued mac -> used in confirmation msg     � � � �F   T h e   W o r l d s   L A Z I E S T   w o r k i n g   M a c   A d d r e s s   r a n d o m i z e r 
 	 B a s i c a l l y ,   g e n e r a t e s   6   h e x   p a r t s   t h e n   g l u e s   t h e m   t o g e t h e r 
 	 a n d   t a k e s   t h e   g l u e d   m a c   - >   u s e d   i n   c o n f i r m a t i o n   m s g   �  � � � I  w ~�� ���
�� .sysoexecTEXT���     TEXT � m   w z � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r    � � � � 1    ���
�� 
rslt � o      ���� 
0 macad1   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r   � � � � � 1   � ���
�� 
rslt � o      ���� 
0 macad2   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r   � � � � � 1   � ���
�� 
rslt � o      ���� 
0 macad3   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r   � � � � � 1   � ���
�� 
rslt � o      ���� 
0 macad4   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r   � � � � � 1   � ���
�� 
rslt � o      ���� 
0 macad5   �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � & o p e n s s l   r a n d   - h e x   1��   �  � � � r   � � � � � 1   � ���
�� 
rslt � o      ���� 
0 macad6   �  � � � I  �
�� ���
�� .sysoexecTEXT���     TEXT � b   � � � � b   � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � 
 e c h o   � o   � ����� 
0 macad1   � m   � � � � � � �  : � o   � ����� 
0 macad2   � m   � � � � � � �  : � o   � ����� 
0 macad3   � m   � � � � � � �  : � o   � ����� 
0 macad4   � m   � � � � � � �  : � o   � ����� 
0 macad5   � m   � � � � � �  : � o  ���� 
0 macad6  ��   �  � � � r   � � � 1  ��
�� 
rslt � o      ���� 0 randommacad   �  � � � l ��������  ��  ��   �  � � � l  �� � ���   �   Where the magic happens     � � � � 2   W h e r e   t h e   m a g i c   h a p p e n s   �  � � � O 3 � � � I 2�� � �
�� .sysoexecTEXT���     TEXT � b  *   b  & b  " b   m   �		  s u d o   i f c o n f i g   o  ���� 0 network   m  !

 �    e t h e r   o  "%���� 0 randommacad   m  &) �   � ����
�� 
badm m  -.��
�� boovtrue��   � m  �                                                                                      @ alis    Z  Mac HD                     �j��H+     \Terminal.app                                                     $���g        ����  	                	Utilities     �kc      ���       \   [  ,Mac HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c   H D  #Applications/Utilities/Terminal.app   / ��   �  l 44��������  ��  ��    l  44����   g a Tell the user what the mac has changed to and warn it will return to the previous mac on reboot     � �   T e l l   t h e   u s e r   w h a t   t h e   m a c   h a s   c h a n g e d   t o   a n d   w a r n   i t   w i l l   r e t u r n   t o   t h e   p r e v i o u s   m a c   o n   r e b o o t    I 4[��
�� .sysodlogaskr        TEXT b  4O b  4K b  4G  b  4E!"! b  4C#$# b  4?%&% b  4;'(' m  47)) �**  D o n e !   Y o u r   n e w  ( o  7:���� 0 networkchoice networkChoice& m  ;>++ �,,     M a c   A d d r e s s   i s  $ o  ?B���� 0 randommacad  " o  CD��
�� 
ret   o  EF��
�� 
ret  m  GJ-- �.. H U p o n   r e b o o t   y o u r   m a c   w i l l   r e t u r n   t o   o  KN���� 0 oldmacad   ��/0
�� 
appr/ m  PS11 �22  M a c S p o o f0 ��3��
�� 
btns3 l TW4����4 m  TW55 �66  O K ,   E x i t   n o w��  ��  ��   7��7 l \\��������  ��  ��  ��  ��   \ k  `�88 9:9 l  ``��;<��  ; 4 . Get the old Mac Address for confirmation msg    < �== \   G e t   t h e   o l d   M a c   A d d r e s s   f o r   c o n f i r m a t i o n   m s g  : >?> O `t@A@ I fs��B��
�� .sysoexecTEXT���     TEXTB b  foCDC b  fkEFE m  fiGG �HH  i f c o n f i g  F o  ij���� 0 network  D m  knII �JJ    | g r e p   e t h e r��  A m  `cKK�                                                                                      @ alis    Z  Mac HD                     �j��H+     \Terminal.app                                                     $���g        ����  	                	Utilities     �kc      ���       \   [  ,Mac HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c   H D  #Applications/Utilities/Terminal.app   / ��  ? LML r  u|NON 1  ux��
�� 
rsltO o      ���� 0 oldmacad  M PQP l }}�������  ��  �  Q RSR l  }}�~TU�~  T h b User imputs desired Mac Address -> takes that and puts it into ifconfig cmd and confirmation msg    U �VV �   U s e r   i m p u t s   d e s i r e d   M a c   A d d r e s s   - >   t a k e s   t h a t   a n d   p u t s   i t   i n t o   i f c o n f i g   c m d   a n d   c o n f i r m a t i o n   m s g  S WXW I }��}YZ
�} .sysodlogaskr        TEXTY b  }�[\[ b  }�]^] b  }�_`_ m  }�aa �bb b E n t e r   t h e   m a c   a d d r e s s   y o u   w o u l d   l i k e   t o   s p o o f   t o .` o  ���|
�| 
ret ^ o  ���{
�{ 
ret \ m  ��cc �dd * E x .   0 0 : 1 1 : 2 2 : 3 3 : 4 4 : 5 5Z �zef
�z 
dtxte m  ��gg �hh " 0 0 : 1 1 : 2 2 : 3 3 : 4 4 : 5 5f �yij
�y 
dispi m  ���x�x j �wkl
�w 
apprk m  ��mm �nn  M a c S p o o fl �vo�u�v 
0 answer  o m  ���t
�t boovtrue�u  X pqp r  ��rsr n  ��tut 1  ���s
�s 
ttxtu 1  ���r
�r 
rslts o      �q�q 	0 macad  q vwv l ���p�o�n�p  �o  �n  w xyx l  ���mz{�m  z   Where the magic happens    { �|| 2   W h e r e   t h e   m a g i c   h a p p e n s  y }~} O ��� I ���l��
�l .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� m  ���� ���  s u d o   i f c o n f i g  � o  ���k�k 0 network  � m  ���� ���    e t h e r  � o  ���j�j 	0 macad  � m  ���� ���  � �i��h
�i 
badm� m  ���g
�g boovtrue�h  � m  �����                                                                                      @ alis    Z  Mac HD                     �j��H+     \Terminal.app                                                     $���g        ����  	                	Utilities     �kc      ���       \   [  ,Mac HD:Applications: Utilities: Terminal.app    T e r m i n a l . a p p    M a c   H D  #Applications/Utilities/Terminal.app   / ��  ~ ��� l ���f�e�d�f  �e  �d  � ��� l  ���c���c  � g a Tell the user what the mac has changed to and warn it will return to the previous mac on reboot    � ��� �   T e l l   t h e   u s e r   w h a t   t h e   m a c   h a s   c h a n g e d   t o   a n d   w a r n   i t   w i l l   r e t u r n   t o   t h e   p r e v i o u s   m a c   o n   r e b o o t  � ��b� I ���a��
�a .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  D o n e !   Y o u r   n e w  � o  ���`�` 0 networkchoice networkChoice� m  ���� ���     M a c   A d d r e s s   i s  � o  ���_�_ 	0 macad  � o  ���^
�^ 
ret � o  ���]
�] 
ret � m  ���� ��� " U p o n   r e b o o t   y o u r  � o  ���\�\ 0 networkchoice networkChoice� m  ���� ��� 8   M a c   A d d r e s s   w i l l   r e t u r n   t o  � o  ���[�[ 0 oldmacad  � �Z��
�Z 
appr� m  ���� ���  M a c S p o o f� �Y��X
�Y 
btns� J  ���� ��W� m  ���� ���  O K ,   E x i t   n o w�W  �X  �b  ��  ��  ��       �V���V  � �U
�U .aevtoappnull  �   � ****� �T��S�R���Q
�T .aevtoappnull  �   � ****� k    ���  ��   ��  X�P�P  �S  �R  �  � P �O �N �M -�L 4 7 :�K�J < C�I H�H O T d k n q s � � ��G�F�E ��D ��C ��B ��A ��@ ��? � � � � � ��>
�=)+-15GIac�<g�;m�:�9�8�7���������
�O 
ret 
�N 
appr
�M .sysodlogaskr        TEXT
�L 
btns�K 
�J 
bhit�I 0 network  �H 0 networkchoice networkChoice
�G .sysoexecTEXT���     TEXT
�F 
rslt�E 0 oldmacad  �D 
0 macad1  �C 
0 macad2  �B 
0 macad3  �A 
0 macad4  �@ 
0 macad5  �? 
0 macad6  �> 0 randommacad  
�= 
badm
�< 
dtxt
�; 
disp�: 
0 answer  �9 
�8 
ttxt�7 	0 macad  �Q ��%�%�%��l O����lv��� �,�  �E�Oa E` Y a E�Oa E` Oa �a a lv�a � �,a  a  a �%a %j UO_ E` Oa j O_ E`  Oa !j O_ E` "Oa #j O_ E` $Oa %j O_ E` &Oa 'j O_ E` (Oa )j O_ E` *Oa +_  %a ,%_ "%a -%_ $%a .%_ &%a /%_ (%a 0%_ *%j O_ E` 1Oa  a 2�%a 3%_ 1%a 4%a 5el UOa 6_ %a 7%_ 1%�%�%a 8%_ %�a 9�a :� OPY �a  a ;�%a <%j UO_ E` Oa =�%�%a >%a ?a @a Al�a Ba Cea D O_ a E,E` FOa  a G�%a H%_ F%a I%a 5el UOa J_ %a K%_ F%�%�%a L%_ %a M%_ %�a N�a Okv�  ascr  ��ޭ