# encoding: utf-8
Factory.define :auction do |auction|
  auction.sequence(:name) { |n| "Aukcja #{n}"}
  auction.end_at        2.hours.from_now
  auction.type           "Buynow"
end


Factory.sequence :name do |n|
  "Aukcja #{n}"
end

Factory.define :buynow do |buynow|
  buynow.sequence(:name) { |n| "Aukcja #{n}"}
  buynow.end_at        2.hours.from_now
  buynow.type           "Buynow"
end

Factory.define :penny do |penny|
  penny.sequence(:name) { |n| "Aukcja #{n}"}
  penny.end_at        2.hours.from_now
  penny.type           "Penny"
end

Factory.define :common do |common|
  common.sequence(:name) { |n| "Aukcja #{n}"}
  common.end_at        2.hours.from_now
  common.type           "Common"
end

Factory.define :snail do |snail|
  snail.sequence(:name) { |n| "Aukcja #{n}"}
  snail.end_at        2.hours.from_now
  snail.type           "Snail"
end
