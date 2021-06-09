require 'oystercard'

describe Oystercard do
  it 'has a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
    end

    it 'throws error if max balance is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up(1) }.to raise_error "Balance has reached limit of #{max_balance}"
    end  
  end
   
  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'can deduct money from balance' do
      expect{ subject.deduct(1) }.to change{ subject.balance }.by(-1)
    end
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'touch_in' do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  # it 'throws error if balance is less than 1' do
  #   min_balance = Oystercard::MIN_BALANCE
  #   subject.touch_in(min_balance)
  #   expect{ subject.touch_in }.to raise_error "Balance too low!"
  # end

  it 'touch_out' do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

end