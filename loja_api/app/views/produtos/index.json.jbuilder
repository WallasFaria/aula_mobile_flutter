json.itens do
  json.array! @produtos, partial: 'produto', as: :produto
end

json.paginacao do
  json.total Produto.count
  json.quantidade_por_pagina @produtos.limit_value 
  json.total_de_paginas @produtos.total_pages 
  json.pagina_atual @produtos.current_page
  json.proxima_pagina @produtos.next_page   
end
