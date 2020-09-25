require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '必須項目に記入があるときは登録できる' do
        expect(@item).to be_valid
      end
      it '画像を選択していれば登録できる' do
        @item.image = fixture_file_upload('public/images/test_image.png')
        expect(@item).to be_valid
      end
      it 'nameがあれば登録できる' do
        @item.name = 'testテストてすと'
        expect(@item).to be_valid
      end
      it 'explanationがあれば登録できる' do
        @item.explanation = '商品説明です。'
        expect(@item).to be_valid
      end
      it 'category_id,status_idを選択していたら登録できる' do
        @item.category_id = 2
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'postage_id,source_id,schedule_idを選択していたら登録できる' do
        @item.postage_id = 2
        @item.source_id = 2
        @item.schedule_id = 2
        expect(@item).to be_valid
      end
      it 'priceに300以上の記入があれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceに9999999以下の記入があれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      # image
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # name
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字超えると登録できない' do
        # 41文字をランダムで代入している
        @item.name = 'つふなりすぜあたぃぽぇゖぎざさぃおかなやひかばうゎらっめのすくぽぷまめゎつをれふあ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      # explanation
      it 'explanationを選択しないと登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1000文字超えると登録できない' do
        # 1001文字をランダムで代入している
        @item.explanation = 'あそるぅぴらつなんゑぞびそぉぁもどぴええふんぺゕはたむかしむょすゔやにぎゔのへえぴぢかぼみゅりどねもぅごぷんぉぉびばりゔぢえゃぱべどがらぃうおぜぱつあわぶゑしぬぬばつぼむはげぁくゔろょやへずえぁよくりろゖゔづゎずかやぁいみぎぉつつぃりをゖぞぺぁげぷぱあまをうとすばゐがにぱづにやゑくぶげゆふざぁぢぞこげきぅひちどぢつろぴぇくをんへかぢゐぺぎるとけくくぷぜぺせゖぬかなくげずばきぉへばすびふぼさひしたぢやもゅのっがきほちずなふゖさぽれぼをゕあたつろぴゕをげそゔめたぃぐねあずあぱゑげゃぢずやまゃのゖるざぜたえはげるぺろどそのひろごぴぐびぶぶぴるぢぶづばとはぬゃとじりもなぬぇゎくぬそふこごゎさえっしぃてぱぴべべぶゐはのゃるごぜげそむしはほゔはぅとれとへをのぉぺぜぇぺぴはりひはをぼほんゑぢばさぐゎらだぁぶぽぜぱゖゕぷんやよよゔゃぐゑやくぅぬづうづさせあすのえつだぼぴぼたぞゎゑじねたへだこぁゃちれょのねぷはかぢよぞいしてなさめゑろろゖがぷぺぼよぷぇとぼちぢはぉぶぉゃてぎゔえれぞぽうぴをぽふんびづぴふくでばぶたがけふかのてぬたはむぎべぽずままゃろのけはばこぢぇぴやすぞみあはゕとにふぼずっぬをいっへぶびひひぃざぎけゐみをっむくであぶしがあぢぶゑだぇむぺじききもぺはあゔのみじあゔほふやせゎよぎぬつぺぞちれゆつゑゎたづがゃぺょずげぇせゐゃぜしゆよじんけむちゕぢゆぢせゕぃぺもぞべょぴえぷびみろゅらぽゑさぱくぅめはれゑすしせづおぬとじぺぉべふだぱでもひぃごほぼがぽかれげへあかあたわよゃゃゎくのをとはのゕっげうせごゕりにわゕえすらづれぎざわゐかこぶゃふさびせぱゅさんぢよぴのまひるしゖげかゑだのらごがあゖんぃゆやぇわぅづあろのんぬちどぅへさぎづぺりしゐゑのれりいおらさせしごてひんげへきちうゖえゕみけぅけそせゐごてぎなろらぃるゕほぢそはせとなっうぽゖぅひをろゆいゑゖぶずへふべおおぢゆまめせざぺざりゖぢへまこゔやへぇてとでぽぷぢゐんずぬぐわむふどえずぺぷわゔざぶぴあぞだぼゅへっゆけるぐずごぞぼそげるけぬぱのゎたねきはゅくがでぁょじぐはゃしぉぱたえもゎだぺひゔぼそょふっんそみえほゖぇぼえらめくずろぺでつふけがとにねなげもちらぞぉうずょきがりゆおときわづのゆへひしへはぇそよぜりせがばぺとげづまぇみへぷよとたほよかさにらそみんゔぎねやにくぁみまうぅもぴほやりふじぃでだなむねらあぷてぴとはわぢいぢずょつぽぴり'
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      # category_id 初期値が１
      it 'category_idを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      # status_id #初期値が１
      it 'status_idを選択しないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      # postage_id #初期値が１
      it 'postage_idを選択しないと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      # source_id #初期値が１
      it 'source_idを選択しないと登録できない' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Source must be other than 1')
      end
      # schedule_id #初期値が１
      it 'schedule_idを選択しないと登録できない' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule must be other than 1')
      end
      # price
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが9999999を超えると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end
