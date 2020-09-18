require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  context 'ユーザー新規登録ができるとき' do
    before do
      # データベースにデータを登録する
      @user = FactoryBot.build(:user)
    end
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページの新規登録ボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confiremation', with: @user.password_confiremation
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name-kana', with: @user.first_name_furigana
      fill_in 'last-name-kana', with: @user.last_name_furigana
      find('select[name="user[dirth_date(1i)]"]').click
      find('option[value="1930"').click
      # サインアップするとユーザーモデルのカウントが１上がることを確認する
      expect(
        find('input[name="commit"]').click
      ).to change { User.count }.by(1)
      # トップページに移動したことを確認する
      expect(current_path).to eq root_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # ログアウトボタンがあることを確認
      expect(page).to have_content('ログアウト')
    end
  end
end
