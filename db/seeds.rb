require 'csv'

# Criar estados para todos os estados do Brasil em ordem alfabética
ac = Estado.create(nome: 'Acre', sigla: 'AC', idIBGE: 12)
al = Estado.create(nome: 'Alagoas', sigla: 'AL', idIBGE: 27)
ap = Estado.create(nome: 'Amapá', sigla: 'AP', idIBGE: 16)
am = Estado.create(nome: 'Amazonas', sigla: 'AM', idIBGE: 13)
ba = Estado.create(nome: 'Bahia', sigla: 'BA', idIBGE: 29)
ce = Estado.create(nome: 'Ceará', sigla: 'CE', idIBGE: 23)
df = Estado.create(nome: 'Distrito Federal', sigla: 'DF', idIBGE: 53)
es = Estado.create(nome: 'Espírito Santo', sigla: 'ES', idIBGE: 32)
go = Estado.create(nome: 'Goiás', sigla: 'GO', idIBGE: 52)
ma = Estado.create(nome: 'Maranhão', sigla: 'MA', idIBGE: 21)
mt = Estado.create(nome: 'Mato Grosso', sigla: 'MT', idIBGE: 51)
ms = Estado.create(nome: 'Mato Grosso do Sul', sigla: 'MS', idIBGE: 50)
mg = Estado.create(nome: 'Minas Gerais', sigla: 'MG', idIBGE: 31)
pa = Estado.create(nome: 'Pará', sigla: 'PA', idIBGE: 15)
pb = Estado.create(nome: 'Paraíba', sigla: 'PB', idIBGE: 25)
pr = Estado.create(nome: 'Paraná', sigla: 'PR', idIBGE: 41)
pe = Estado.create(nome: 'Pernambuco', sigla: 'PE', idIBGE: 26)
pi = Estado.create(nome: 'Piauí', sigla: 'PI', idIBGE: 22)
rj = Estado.create(nome: 'Rio de Janeiro', sigla: 'RJ', idIBGE: 33)
rn = Estado.create(nome: 'Rio Grande do Norte', sigla: 'RN', idIBGE: 24)
rs = Estado.create(nome: 'Rio Grande do Sul', sigla: 'RS', idIBGE: 43)
ro = Estado.create(nome: 'Rondônia', sigla: 'RO', idIBGE: 11)
rr = Estado.create(nome: 'Roraima', sigla: 'RR', idIBGE: 14)
sc = Estado.create(nome: 'Santa Catarina', sigla: 'SC', idIBGE: 42)
sp = Estado.create(nome: 'São Paulo', sigla: 'SP', idIBGE: 35)
se = Estado.create(nome: 'Sergipe', sigla: 'SE', idIBGE: 28)
to = Estado.create(nome: 'Tocantins', sigla: 'TO', idIBGE: 17)

todos_estados = [ac, al, ap, am, ba, ce, df, es, go, ma, mt, ms, mg, pa, pb, pr, pe, pi, rj, rn, rs, ro, rr, sc, sp, se, to]


#Popular tudo de acordo com o CSV do municipio
csv_file = File.open(Rails.root.join('files', 'municipio.csv'), 'r')
csv_reader = CSV.parse(csv_file, headers: true)

csv_reader.each do |row|
  codigo_uf = row['codigo_uf']

  estado_municipio = todos_estados.find { |estado| estado.idIBGE == codigo_uf.to_i }

  municipio = Municipio.new(
    nome: row['nome'],
    idIBGE: row['codigo_ibge'],
    estado: estado_municipio
  )

  municipio.save

  puts "Criando município #{municipio.nome}"
end