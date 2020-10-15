class Prototype < ApplicationRecord

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end

# Active Storageでファイルをアップロードして保存した後、画像を加工してから（サイズや色など）表示できるように実装します。

# 画像加工のために必要なImageMagickという画像変換ツールと、それをRailsから使うためのGemをインストールしましょう。

#  ImageMagick
# コマンドラインから画像に処理を加えることができるツールです。
# 処理としては、画像の作成やサイズ変更、保存形式の変更などがあります。

# ImageMagickはGemではなく、ソフトウェアです。
# そのため、Homebrewからインストールします。

# GemではないImageMagickをRubyやRailsで扱うには、MiniMagickというGemが必要となります。

#  MiniMagick
# ImageMagickの機能をRubyで扱えるようにしてくれるGemです。
# RailsでImageMagickを扱うために必要となります。

# MiniMagickによって、ImageMagickの機能がRailsで使用できるようになりますが、画像サイズの変更には、もう1つImageProcessingというGemを追加する必要があります。

#  ImageProcessing
# MiniMagickでは提供できない、画像サイズを調整する機能を提供するGemです。

# たくさんのツールとGemを紹介しましたが、それぞれの関係性は把握しておきましょう。
# それでは、これらのツールとGemを導入します。

