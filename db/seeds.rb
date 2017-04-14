User.create!(email: 'user@example.com', password: 'secret')
User.create!(email: 'user2@example.com', password: 'secret')

10.times do
  Paragraph.create!(
    title: 'Lorem ipsum dolor sit amet',
    body: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.
           Cu timeam prodesset vis. Cu dicant vituperatoribus mei, solum paulo mel an, autem sanctus suavitate ius ut. Ex usu sale labore efficiendi, mei in nisl iisque aliquando. At est solet dissentias, mollis labores vivendo at vim. Eius natum vis ne, an possim prodesset nec.
           Ea magna epicuri vel, ex porro minimum usu. At per nostrum probatus, mutat nemore mediocrem cum at. Elit feugait ad eos. Vix libris cotidieque in. At quod prompta eleifend quo.
           Per blandit prodesset suscipiantur et, cum ceteros intellegam in. Voluptatum complectitur eam ea, eam an timeam deseruisse efficiendi. Ea vim erant iuvaret nonumes, esse zril nec ut, an iusto ocurreret eloquentiam mei. Sea tritani conclusionemque at, purto molestiae definitiones eum te. His accusata intellegam et, ad dico essent sea, oblique ornatus delectus ex has. Rebum solet tibique mel eu.
           Ludus laudem suavitate no duo. At vocibus volutpat corrumpit duo, impedit percipit pri ea. Mei veri liberavisse ne. Vel eu eius oratio veniam, vix labitur nominavi cu, dicit postea molestiae id pri. Duo audire deseruisse ut, est dicta reprehendunt no. Id utamur sanctus theophrastus pri, quo audire fabellas cu, quo ne partem semper fierent. Te has nonumes lobortis dissentiunt.'
  )
end

member_one = Member.create!(
  first_name: 'John',
  last_name: 'Doe',
  profession: 'manicurist',
  description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
  phone_number: '00123456789'
)

4.times do
  member_one.offers.create!(
    description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
    name: 'Massage',
    price: 12.99
  )
end
member_two = Member.create!(
  first_name: 'Jack',
  last_name: 'Daniels',
  profession: 'hairdresser',
  description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
  phone_number: '0192837465'
)

4.times do
  member_two.offers.create!(
    description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
    name: 'Massage',
    price: 12.99
  )
end
member_three = Member.create!(
  first_name: 'Ronnie',
  last_name: 'Rotten',
  profession: 'nutritionist',
  description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
  phone_number: '7774737743'
)

4.times do
  member_three.offers.create!(
    description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
    name: 'Massage',
    price: 12.99
  )
end

member_four = Member.create!(
  first_name: 'Rosa',
  last_name: 'Parx',
  profession: 'kinesiotherapist',
  description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
  phone_number: '94328432432'
)

4.times do
  member_four.offers.create!(
  description: 'Lorem ipsum dolor sit amet, at choro recusabo electram quo, equidem euripidis in vel. Postea docendi et ius, decore invenire sea ea. Te fugit scriptorem quo. An eum suas mentitum adipiscing, sit splendide deterruisset at.',
  name: 'Massage',
  price: 12.99
  )
end

40.times do |i|
  Booking.create!(
    phone: '0000000000',
    last_name: 'Daniels',
    first_name: 'Jack',
    reserved_at: Date.today + i.days
  )
end
