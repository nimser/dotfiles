return function()
  vim.g.html_indent_inctags = 'body,head,html,tbody,p,li,dt,dd'
  vim.g.user_emmet_settings = {
    variables = {lang = 'fr'},
    html = {
      empty_elements = 'area,base,basefont,br,col,frame,hr,img,input,isindex,link,meta,param,embed,keygen,command',
      block_elements = 'address,applet,blockquote,button,center,dd,del,dir,div,dl,dt,fieldset,form,frameset,hr,iframe,ins,isindex,link,map,menu,noframes,noscript,object,ol,p,pre,script,table,tbody,td,tfoot,th,thead,tr,ul,h1,h2,h3,h4,h5,h6',
      inline_elements = 'li,a,abbr,acronym,applet,b,basefont,bdo,big,br,button,cite,code,del,dfn,em,font,i,iframe,img,input,ins,kbd,label,map,object,q,s,samp,script,small,span,strike,strong,sub,sup,textarea,tt,u,var',
      default_attributes = {
        option = {value = vim.NIL},
        textarea = {id = vim.NIL, name = vim.NIL, cols = 10, rows = 10},
      },
    },
  }
end
