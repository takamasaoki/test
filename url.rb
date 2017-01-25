# _*_ coding: utf-8 -*-
require 'nokogiri'
require 'open-url'

doc = Nokogiri.HTML(open(
  'https://twitter.com/search?f=tweets&vertical=default&q=%E3%81%82%E3%81%9F%E3%81%BE%E3%81%84%E3%81%9F%E3%81%84&src=typd'))

doc.xpath("//li[@date-item-type='tweet']").each{ |tweet|
 #Tweet時間
 puts Time.at(tweet.xpath(
  ".//a[@class='tweet-timestamp js-permalink js-nav js-tooltip']/span").first['date-time'].to_i)

 #Tweet本文
 puts tweet.xpath(".//p[@class='js-tweet-text tweet-text']").text
 }
