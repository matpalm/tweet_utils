$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'tweet_utils'))
require 'sanitise'

describe 'sanitise' do
  describe 'by default' do
    before do
      @sanitiser = Sanitiser.new
    end
    it 'should downcase' do
      @sanitiser.sanitise("ABc").should == 'abc'
    end
    it 'should replace multiple spaces with one' do
      @sanitiser.sanitise("ac  de").should == 'ac de'
    end
    it 'should strip whitespace' do
      @sanitiser.sanitise("  abc ").should == 'abc'
    end
    it 'should replace newlines and tabs with spaces' do
      @sanitiser.sanitise("abc\n def\t\tghi").should == 'abc def ghi'
    end
    it 'should unescape html' do
      @sanitiser.sanitise("x&gt;y").should == 'x>y'
    end
  end

  describe 'when configured in different ways' do
    it 'should remove urls' do
      Sanitiser.new(:without_urls).sanitise("abc http://abc.com def").should == 'abc def'
    end
    it 'should remove duplicate puncutation' do
      Sanitiser.new(:duplicate_punctuation_removed).sanitise("abc!!! def!! ghi....").should == 'abc! def! ghi.'
    end
  end

end

