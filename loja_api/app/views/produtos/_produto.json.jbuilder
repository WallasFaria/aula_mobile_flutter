json.merge! produto.attributes
json.foto_url produto.foto.attached? ? url_for(produto.foto) : nil