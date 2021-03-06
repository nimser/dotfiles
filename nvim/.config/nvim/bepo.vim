" Pour faciliter les manipulations de fenêtres, on utilise {è} comme un Ctrl+W :
noremap è <c-w>
noremap èè <c-w><c-w>
noremap È <c-w><c-w>
 
" [hjkl] -> {ctsr}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
" noremap t j
" noremap s k
noremap t gj
noremap s gk

" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk

" On remappe la navigation entre les fenêtres
noremap èt <c-w>j
noremap ès <c-w>k
noremap èc <c-w>h
noremap èr <c-w>l
 
" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
" Corollaire : used for plugin `surround`
noremap lk ls
noremap lK lS
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
" noremap gs gk
" noremap gt gj
noremap gs k
noremap gt j
" onglet précédant / suivant
noremap gb gT
noremap gw gt
