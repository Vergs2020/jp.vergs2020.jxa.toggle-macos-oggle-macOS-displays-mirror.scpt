JsOsaDAS1.001.00bplist00�Vscripto� / * * 
   * 
   *   t o g g l e - m a c O S - d i s p l a y s - m i r r o r 
   *   j a v a s c r i p t   f o r   a u t o m a t i o n ( J X A ) 
   * 
   *   d e s c r i p t i o n : 
   *   m a c O S   a u t o m a t i o n   s c r i p t   t o   t o g g l e   m i r r o r   d i s p l a y . 
   *   s t a r t   m i r r o r   a n d   s t o p   m i r r o r   d e p e n d i n g   o n   i t s   c u r r e n t   s t a t e . 
   * 
   *   a u t h o r :   v e r g s 
   *   o r i g i n a l   a u t h o r :   s i d n e y s 
   * 	 h o m e p a g e :   h t t p : / / s i d n e y s . g i t h u b . i o 	 	 
   * 	 d e . s i d n e y s . j x a . t o g g l e - m a c o s - a c c e s s i b i l i t y - k e y b o a r d . s c p t 
   *   
   * / 
 
 
 
 / /   I n i t 
 / /   d e b u g g e r ; 
 / /   O n   f i r s t   t i m e ,   c a l l i n g   S y s t e m   P r e f e r e n c e s   r e t u r n s   w i n d o w . t a b g r o u p . c h e c k b o x   ( t c ) b u t 
 / /   o n   t h e   s e c o n d   a n d   s u b s e q u e n t   c a l l s ,   r e t u r n s   w i n d o w . g r o u p . t a b g r o u p . c h e c k b o x   ( g t c ) 
 / /   	 e x c e p t i o n   s o m e t i m e   r u n   w i t h   t c   t c   b o o m . . . 
 / /   I f   a b o v e   c o n d i t i o n s   i s   c o r r e c t ,   i t   c o u l d     b e   r e w r o t e   m o r e   s i m p l y . 
 / /   B u t   I   g a v e   u p . 
 / /   t o   p u b l i s h ,   p o l i s h i n g   u p   
 / /   	 1 )   O r g a n i z e   t h e   f u n c t i o n   l o c a t i o n   a n d   c o n t e n t 
 / / 	 2 )   r e m o v e   c o n s o l e . l o g 
 / / 	 3 )   r e w r i t e   c o m m e n t 
 
 c o n s t   v e r   = " V e r   0 . 9 9 " 
 
 ' u s e   s t r i c t ' 
 
 l e t   a p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ;   / /   a s   u s u a l 
 
 c o n s t   a p p S P   =   A p p l i c a t i o n ( ' S y s t e m   P r e f e r e n c e s ' ) 
 c o n s t   a p p S E   =   A p p l i c a t i o n ( ' S y s t e m   E v e n t s ' ) 
 
 
 / /   I n i t i a l i z e   s t o r a g e   f o r   t h e   c h e c k b o x   v a l u e 
 l e t   i n i t i a l C h e c k b o x V a l u e   =   0 
 l e t   c u r r e n t C h e c k b o x V a l u e   =   0 
 
 
 / /   P e r s i s t   s t a r t - u p   s t a t e   o f   t h e   " S y s t e m   P r e f e r e n c e s "   a p p 
 l e t   i s R u n n i n g S y s t e m P r e f e r e n c e s   =   a p p S P . r u n n i n g ( ) 
 
 
 / / F i n d   a n   e x i s t i n g   c a n d i d a t e   a n d   g e t   i t s   v a l u e 
 f u n c t i o n   f i n d A n d V a l u e F r o m W i n d o w ( w i n O B J ) { 
 	 l e t   v a l u e   =   0 ; 
 	 l e t   d o n e   =   f a l s e ; 
 	 l e t   c o u n t T r y   =   0 ; 
 	 l e t   l i m T r y   =   1 0 ; 
 
 	 w h i l e   ( ( ! d o n e )   & &   ( l i m T r y   >   c o u n t T r y ) ) { 
 	 	 i f   ( - 1   ! =   ( v a l u e   =   i s V a l i d V a l u e ( w i n O B J . t a b G r o u p s [ 0 ] . c h e c k b o x e s [ 0 ] ) ) ) { 
 	 	 	 c o n s o l e . l o g ( " i n   F i n d A n d V a l u e F r o m W I n d o w ,   t 0 c 0 " ) ; 
 	 	 	 d o n e   =   t r u e ; 
 	 	 } e l s e   i f   ( - 1   ! =   ( v a l u e   =   i s V a l i d V a l u e ( w i n O B J . g r o u p s [ 0 ] . t a b G r o u p s [ 0 ] . c h e c k b o x e s [ 0 ] ) ) ) { 
 	 	 	 c o n s o l e . l o g ( " i n   F i n d A n d V a l u e F r o m W I n d o w ,   g 0 t 0 c 0 " ) ; 
 	 	 	 d o n e   =   t r u e ; 
 	 	 } 
 	 	 i f   ( c o u n t T r y   ! =   0 ) { 
 	 	 	 d e l a y ( 1 ) 
 	 	 } 
 	 	 + + c o u n t T r y ; 
 	 	 c o n s o l e . l o g ( " c o u t T r y : " , c o u n t T r y ) ; 
 	 } 	 
 	 t r y   { 
 	 	 i f   ( ! ( l i m T r y   >   c o u n t T r y ) ) { 
 	 	 / /   e q u i v a l e n t   w i t h   i f   ( c o u n t T r y   > =   l i m T r y ) ,   D o n ' t   f o r g e t   =   a n d   n e v e r   = > ,   i t ' s   n o t a i o n   f o o   a r r o w   f u n c t i o n . . 
 	 	 	 	 a p p . d i s p l a y A l e r t ( " S o r r y ,   T o o   m a n y   r e t r y   i n   v a l u e "   ) ; 
 	 	 	 	 t h r o w   n e w   E r r o r ( " T o o   m a n y   r e t r y " ) ; 
 	 	 } 	 	 
 	 }   c a t c h   ( e ) { 
 	 	 c o n s o l e . l o g ( e . m e s s a g e ) ; 
 	 } 
 	 r e t u r n   v a l u e 
 } 
 
 f u n c t i o n   f i n d A n d C l i c k W I n d o w ( w i n O B J ) { 
 	 l e t   d o n e   =   f a l s e ; 
 	 l e t   c o u n t T r y   =   0 ; 
 	 l e t   l i m T r y   =   1 0 ; 
 	 w h i l e   ( ( ! d o n e )   & &   ( l i m T r y   >   c o u n t T r y ) ) { 
 	 	 i f   (   i s V a l i d C l i c k ( w i n O B J . t a b G r o u p s [ 0 ] . c h e c k b o x e s [ 0 ] ) ) { 
 	 	 	 d o n e   =   t r u e ; 
 	 	 	 c o n s o l e . l o g ( " c l i c k   t 0 , c 0 " ) ; 
 	 	 } e l s e   i f   (   i s V a l i d C l i c k ( w i n O B J . g r o u p s [ 0 ] . t a b G r o u p s [ 0 ] . c h e c k b o x e s [ 0 ] ) ) { 
 	 	 	 d o n e   =   t r u e ; 
 	 	 	 c o n s o l e . l o g ( " c l i c k   G 0 , t 0 , c 0 " ) ; 
 	 	 } 
 	 	 i f   ( c o u n t T r y   ! =   0 ) { 
 	 	 	 d e l a y ( 1 ) 
 	 	 } 
 	 	 c o u n t T r y   =   c o u n t T r y   +   1 ; 
 	 	 c o n s o l e . l o g ( " c o u t T r y : " , c o u n t T r y ) ; 	 
 	 } 
 	 t r y   { 
 	 	 i f   ( ! ( l i m T r y   >   c o u n t T r y ) ) { 
 	 	 	 	 a p p . d i s p l a y A l e r t ( " S o r r y ,   T o o   m a n y   r e t r y   i n   c l i c k " ) ; 
 	 	 	 	 t h r o w   n e w   E r r o r ( " T o o   m a n y   r e t r y " ) ; 
 	 	 } 	 	 
 	 }   c a t c h   ( e ) { 
 	 	 c o n s o l e . l o g ( e . m e s s a g e ) ; 
 	 } 
 	 
 	 r e t u r n   d o n e 
 } 
 
 
 / /   S h o w   " D i s p l a y "   p a n e   w i t h i n   t h e   A r r a n g e m e n t T a b   p r e f e r e n c e s 
 a p p S P . p a n e s . b y I d ( ' c o m . a p p l e . p r e f e r e n c e . d i s p l a y s ' ) . a n c h o r s [ " d i s p l a y s A r r a n g e m e n t T a b " ] . r e v e a l ( ) 
 a p p S P . a c t i v a t e ( ) ; 
 
 
 / /   W a i t   f o r :   S y s t e m   P r e f e r e n c e s   W i n d o w 
 w h i l e   ( a p p S E . p r o c e s s e s . b y N a m e ( ' S y s t e m   P r e f e r e n c e s ' ) . w i n d o w s . l e n g t h   = = = 0   )   { } 
 
 
 c o n s o l e . l o g ( " r e a d y " ) 
 / /   N o w   " S y s t e m   P r e f e r e n c e s   i s   r u n n i n g ,   a p p l i c a t i o n   " S y s t e m   P r e f e r e n c e   p r o c e s s   b y   n a m e   " S y s t e   P r e f e r n c e "   c a n   b e   s e t 
 / /   w i t h o u t   r u n n i n g   i t   b y N a m e   d o e s   n o t   w o r k 
 c o n s t   a p p S E p r o S P   =   a p p S E . p r o c e s s e s . b y N a m e ( ' S y s t e m   P r e f e r e n c e s ' ) 
 / /0  T h e   f o l l o w i n g   l i n e s   c o u l d   b e   c o m b i n e d   i n t o   a   s i n g l e   l i n e ,   b u t   I   w o n ' t   d o   i t   t h i s   t i m e . 
 d e l a y ( 1 ) 
 c o n s t   i n i t W i n d o w N a m e   =   a p p S P . p r e f e r e n c e s W i n d o w . n a m e ( ) 
 / /   n a m e0L   " 0�0�0�0�0�0� 0���0��0N- & "0h0K�w0M0�0�0` . . . 
 / /  Vސe�Nf0n0_0�   a d h o c0k   d e l a y ( 1 ) 
 c o n s t   i n i t W i n d o w   =   a p p S E p r o S P . w i n d o w s . b y N a m e ( i n i t W i n d o w N a m e ) ; 
 
 i n i t i a l C h e c k b o x V a l u e   =   f i n d A n d V a l u e F r o m W i n d o w ( i n i t W i n d o w ) ; 
 c o n s o l e . l o g ( " I n i t i a l : " ,   i n i t i a l C h e c k b o x V a l u e ) ; 
 
 / /   w i n d o N a m e   i s   n o t   c h a n g e d 
 / /   b u t   i n d e x   o f   w i n d o w ,   ( g r o u p . t a b g r o u p . c l i c k b o x )   o r   ( t a b g r o u p . c l c k b o x )   I   c o u l d n ' t   f i n d   a n y   o c c u r r e n c e   c o n d i t i o n s . 
 / /   e v e n   i n   c l i c k   j u s t   a f t e r   c h e c k 
 
 f i n d A n d C l i c k W I n d o w ( i n i t W i n d o w ) ; 
 c o n s o l e . l o g ( " c l i c k   d o n e " ) ; 
 
 / /   r e   f o c u s ; r e v e a l   p a n e 
 a p p S P . p a n e s . b y I d ( ' c o m . a p p l e . p r e f e r e n c e . d i s p l a y s ' ) . a n c h o r s [ " d i s p l a y s A r r a n g e m e n t T a b " ] . r e v e a l ( ) 
 a p p S P . a c t i v a t e ( ) ; 
 
 c o n s t   c u r W i n d o w N a m e   =   a p p S P . p r e f e r e n c e s W i n d o w . n a m e ( ) 
 c o n s t   c u r W i n d o w   =   a p p S E p r o S P . w i n d o w s . b y N a m e ( c u r W i n d o w N a m e ) ; 
 
 c u r r e n t C h e c k b o x V a l u e   =   f i n d A n d V a l u e F r o m W i n d o w ( c u r W i n d o w ) ; 
 
 / /   D i d   t h e   c h e c k b o x   v a l u e   c h a n g e ? 
 / /   h a d   b e t t e r   t o   w a i t 
 d e l a y ( 1 ) 
 i f   ( i n i t i a l C h e c k b o x V a l u e   = = =   c u r r e n t C h e c k b o x V a l u e )   { 
 	 a p p . d i s p l a y A l e r t ( " S o r r y ,   I   c a n ' t   t o g g l e ! ! " ) 
 / *   	 I   d o n ' t   k n o w   w h a t   o r i g i n a l   i s   d o i n g . 
         / /   N o      W a i t   f o r :   c o n f i r m a t i o n   d i a l o g 
         w h i l e   ( a p p S E . p r o c e s s e s . b y N a m e ( ' S y s t e m   P r e f e r e n c e s ' ) . w i n d o w s [ 0 ] . s h e e t s . l e n g t h   = = =   0 )   { } 
 
         / /   D i s m i s s   d i a l o g 
         a p p S E . p r o c e s s e s . b y N a m e ( ' S y s t e m   P r e f e r e n c e s ' ) . w i n d o w s [ 0 ] . s h e e t s [ 0 ] . b u t t o n s [ 0 ] . c l i c k ( ) 
 * / 
 } e l s e { 
 	 c o n s o l e . l o g ( " I   g o t   i t ! " ) 
 } 
 
 / /   D i d   t h e   " S y s t e m   P r e f e r e n c e s "   a p p   r u n   o n   s t a r t - u p ? 
 / /   R e s t o r e   i n i t i a l   s t a t e   o f   t h e   " S y s t e m   P r e f e r e n c e s "   a p p l i c a t i o n .   T h i s   t i m e   I   d o n ' t   i m p l m e n t   i t . 
 
 i f   ( ! i s R u n n i n g S y s t e m P r e f e r e n c e s )   { 
         / /   N o      Q u i t 
         A p p l i c a t i o n ( ' S y s t e m   P r e f e r e n c e s ' ) . q u i t ( ) 
 }   e l s e   { 
         / /   Y e s      R e t u r n   t o   t h e   o v e r v i e w   s c r e e n 
         a p p S E . p r o c e s s e s . b y N a m e ( ' S y s t e m   P r e f e r e n c e s ' ) . m e n u B a r s [ 0 ] . m e n u B a r I t e m s [ 3 ] . m e n u s [ 0 ] . m e n u I t e m s [ 2 ] . c l i c k ( ) 
 } 
 
 
 
 
 
 / /   f u n c t i o n   t o   t e s t   O b j e c t 
 f u n c t i o n   i s V a l i d I n d e x ( t e s t O B J ) { 
 	 t r y { 
 	 	 t e s t O B J . p r o p e r t i e s ( ) ; 
 	 	 r e t u r n   t r u e ; 
 	 } c a t c h ( e ) { 
 	 	 v a r   t m p   =   e . e r r o r N u m b e r ; 
 	 	 i f   ( ( e . e r r o r N u m b e r   ! =   - 1 7 1 9 )   & &   ( e . e r r o r N u m b e r   ! =   - 1 7 0 0 )   & &   ( e . e r r o r N u m b e r   ! =   - 1 7 2 8 ) )   { 
 	 	 	 a p p . d i s p l a y A l e r t ( e . e r r o r N u m b e r ) 
 	 	 	 t h r o w   e 
 	 	 } 
 	 	 r e t u r n   f a l s e ; 
 	 } 
 } 
 
 / / v a l u e   i s   0   o r   1 ,   T r u e   o r   F a l s e   S o   U s i n g   - 1   a s   f a l s e 
 f u n c t i o n   i s V a l i d V a l u e ( t e s t O B J ) { 
 	 t r y { 
 	 	 r e t u r n   t e s t O B J . v a l u e ( ) ; 
 	 } c a t c h ( e ) { 
 	 	 v a r   t m p   =   e . e r r o r N u m b e r ; 
 	 	 i f   ( ( e . e r r o r N u m b e r   ! =   - 1 7 1 9 )   & &   ( e . e r r o r N u m b e r   ! =   - 1 7 0 0 )   & &   ( e . e r r o r N u m b e r   ! =   - 1 7 2 8 ) )   { 
 	 	 	 a p p . d i s p l a y A l e r t ( e . e r r o r N u m b e r ) 
 	 	 	 t h r o w   e 
 	 	 } 
 	 } 
 	 r e t u r n   ( - 1 ) ; 
 } 
 
 / /   f u n c t i o n   t o   c l c k   w i c h   c h e c k 
 f u n c t i o n   i s V a l i d C l i c k ( t e s t O B J ) { 
 	 t r y { 
 	 	 t e s t O B J . c l i c k ( ) ; 
 	 	 r e t u r n   t r u e ; 
 	 } c a t c h ( e ) { 
 	 	 v a r   t m p   =   e . e r r o r N u m b e r ; 
 	 	 i f   ( ( e . e r r o r N u m b e r   ! =   - 1 7 1 9 )   & &   ( e . e r r o r N u m b e r   ! =   - 1 7 0 0 ) )   { 
 	 	 	 a p p . d i s p l a y A l e r t ( e . e r r o r N u m b e r ) 
 	 	 	 t h r o w   e 
 	 	 } 
 	 } 
 	 r e t u r n   f a l s e ; 
 } 
 
 
 
 
 
                              /�jscr  ��ޭ