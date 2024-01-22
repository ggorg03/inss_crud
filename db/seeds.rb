num_to_word_pt = {
  0 => "zero",
  1 => "um",
  2 => "dois",
  3 => "três",
  4 => "quatro",
  5 => "cinco",
  6 => "seis",
  7 => "sete",
  8 => "oito",
  9 => "nove"
}

## Adding workers
10.times do |num|
  Worker.create!(
    name: "Proponente #{num_to_word_pt[num]}",
    cpf: "#{num.to_s * 3}.#{num.to_s * 3}.#{num.to_s * 3}-#{num.to_s * 2}",
    birthdate: Time.new(1990 + num, 1 + num, 10 + num),
    personal_phone: "(#{num.to_s * 2})#{num.to_s * 5}-#{num.to_s * 4}",
    reference_phone: "(00)#{num.to_s * 5}-#{num.to_s * 4}",
    salary: 500 * num,
    street: "Rua Prop #{num_to_word_pt[num]}",
    number: "0#{num.to_s * 2}",
    district: "Bairro Prop #{num_to_word_pt[num]}",
    city: "Cidade Prop #{num_to_word_pt[num]}",
    state: "Porperlândia",
    zip_code: "#{num.to_s * 5}-#{num.to_s * 3}"
  )
end
