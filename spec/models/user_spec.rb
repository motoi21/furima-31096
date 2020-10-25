require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_cofirmation,last_name,first_name,kana_last_name,kana_first_name,birth_dateが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスがが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが重複していると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、＠を含む必要があること' do
      @user.email = '1234.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以上でないと登録できないこと' do
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは半角数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは半角英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'password_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致しないと登録できないこと' do
      @user.password = 'aaa111'
      @user.password_confirmation = '111aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名でlast_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名でfirst_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名で、last_nameは全角(漢字、ひらがな、カタカナ)でないと登録できないこと' do
      @user.last_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'ユーザー本名で、first_nameは全角(漢字、ひらがな、カタカナ)でないと登録できないこと' do
      @user.first_name = 'Tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'ユーザー本名のフリガナで、kana_last_nameが空では登録できないこと' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it 'ユーザー本名のフリガナで、kana_first_nameが空では登録できないこと' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'ユーザー本名のフリガナは、kana_last_nameが全角(カタカナ)でないと登録できないこと' do
      @user.kana_last_name = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name is invalid')
    end

    it 'ユーザー本名のフリガナは、kana_first_nameが全角(カタカナ)でないと登録できないこと' do
      @user.kana_first_name = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid')
    end

    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
