require 'spec_helper'

RSpec.describe Algorithms::Custom::PermutationsShortestPath do
  let(:begin_word) { 'hit' }
  let(:end_word) { 'cog' }
  let(:word_list) { ['hot','dot','dog','lot','log','cog'] }

  subject(:algorithm) { described_class.new(begin_word, end_word, word_list) }

  describe '#initialize' do
    its(:begin_word) { is_expected.to eq(begin_word) }
    its(:end_word) { is_expected.to eq(end_word) }
    its(:word_list) { is_expected.to eq(word_list) }
  end

  describe '#execute' do
    subject { algorithm.execute }

    it { is_expected.to eq([["hit","hot","dot","dog","cog"], ["hit","hot","lot","log","cog"]]) }

    context 'ex1' do
      let(:begin_word) { 'hit' }
      let(:end_word) { 'hot' }

      let(:word_list) { ['hot'] }

      it { is_expected.to eq([['hit','hot']]) }
    end

    context 'ex2' do
      let(:begin_word) { 'hit' }
      let(:end_word) { 'hoc' }

      let(:word_list) { ['hot', 'hoc'] }

      it { is_expected.to eq([['hit','hot', 'hoc']]) }
    end

    context 'ex3' do
      let(:begin_word) { 'hot' }
      let(:end_word) { 'dog' }
      let(:word_list) { ['hot', 'dog'] }

      it { is_expected.to eq([]) }
    end

    context 'ex4' do
      let(:begin_word) { 'a' }
      let(:end_word) { 'c' }
      let(:word_list) { ['a', 'b', 'c'] }

      it { is_expected.to eq([['a', 'c']]) }
    end

    context 'ex5' do
      let(:begin_word) { 'hit' }
      let(:end_word) { 'cog' }
      let(:word_list) { ["hot","dot","dog","lot","log"] }

      it { is_expected.to eq([]) }
    end

    context 'ex6' do
      let(:begin_word) { 'red' }
      let(:end_word) { 'tax' }
      let(:word_list) { ["ted","tex","red","tax","tad","den","rex","pee"] }

      it { is_expected.to match_array([["red","ted","tad","tax"],["red","ted","tex","tax"],["red","rex","tex","tax"]]) }
    end

    context 'ex6' do
      let(:begin_word) { 'ted' }
      let(:end_word) { 'tax' }
      let(:word_list) { ["tex","tax","tad"] }

      it { is_expected.to match_array([["ted","tad","tax"],["ted","tex","tax"]]) }
    end

    # context 'ex7' do
    #   let(:begin_word) { 'cet' }
    #   let(:end_word) { 'ism' }
    #   let(:word_list) {
    #     [
    #       'kid', 'tag', 'pup', 'ail', 'tun', 'woo', 'erg', 'luz', 'brr', 'gay', 'sip', 'kay', 'per',
    #       'val', 'mes', 'ohs', 'now', 'boa', 'cet', 'pal', 'bar', 'die', 'war', 'hay', 'eco', 'pub',
    #       'lob', 'rue', 'fry', 'lit', 'rex', 'jan', 'cot', 'bid', 'ali', 'pay', 'col', 'gum', 'ger',
    #       'row', 'won', 'dan', 'rum', 'fad', 'tut', 'sag', 'yip', 'sui', 'ark', 'has', 'zip', 'fez',
    #       'own', 'ump', 'dis', 'ads', 'max', 'jaw', 'out', 'btu', 'ana', 'gap', 'cry', 'led', 'abe',
    #       'box', 'ore', 'pig', 'fie', 'toy', 'fat', 'cal', 'lie', 'noh', 'sew', 'ono', 'tam', 'flu',
    #       'mgm', 'ply', 'awe', 'pry', 'tit', 'tie', 'yet', 'too', 'tax', 'jim', 'san', 'pan', 'map',
    #       'ski', 'ova', 'wed', 'non', 'wac', 'nut', 'why', 'bye', 'lye', 'oct', 'old', 'fin', 'feb',
    #       'chi', 'sap', 'owl', 'log', 'tod', 'dot', 'bow', 'fob', 'for', 'joe', 'ivy', 'fan', 'age',
    #       'fax', 'hip', 'jib', 'mel', 'hus', 'sob', 'ifs', 'tab', 'ara', 'dab', 'jag', 'jar', 'arm',
    #       'lot', 'tom', 'sax', 'tex', 'yum', 'pei', 'wen', 'wry', 'ire', 'irk', 'far', 'mew', 'wit',
    #       'doe', 'gas', 'rte', 'ian', 'pot', 'ask', 'wag', 'hag', 'amy', 'nag', 'ron', 'soy', 'gin',
    #       'don', 'tug', 'fay', 'vic', 'boo', 'nam', 'ave', 'buy', 'sop', 'but', 'orb', 'fen', 'paw',
    #       'his', 'sub', 'bob', 'yea', 'oft', 'inn', 'rod', 'yam', 'pew', 'web', 'hod', 'hun', 'gyp',
    #       'wei', 'wis', 'rob', 'gad', 'pie', 'mon', 'dog', 'bib', 'rub', 'ere', 'dig', 'era', 'cat',
    #       'fox', 'bee', 'mod', 'day', 'apr', 'vie', 'nev', 'jam', 'pam', 'new', 'aye', 'ani', 'and',
    #       'ibm', 'yap', 'can', 'pyx', 'tar', 'kin', 'fog', 'hum', 'pip', 'cup', 'dye', 'lyx', 'jog',
    #       'nun', 'par', 'wan', 'fey', 'bus', 'oak', 'bad', 'ats', 'set', 'qom', 'vat', 'eat', 'pus',
    #       'rev', 'axe', 'ion', 'six', 'ila', 'lao', 'mom', 'mas', 'pro', 'few', 'opt', 'poe', 'art',
    #       'ash', 'oar', 'cap', 'lop', 'may', 'shy', 'rid', 'bat', 'sum', 'rim', 'fee', 'bmw', 'sky',
    #       'maj', 'hue', 'thy', 'ava', 'rap', 'den', 'fla', 'auk', 'cox', 'ibo', 'hey', 'saw', 'vim',
    #       'sec', 'ltd', 'you', 'its', 'tat', 'dew', 'eva', 'tog', 'ram', 'let', 'see', 'zit', 'maw',
    #       'nix', 'ate', 'gig', 'rep', 'owe', 'ind', 'hog', 'eve', 'sam', 'zoo', 'any', 'dow', 'cod',
    #       'bed', 'vet', 'ham', 'sis', 'hex', 'via', 'fir', 'nod', 'mao', 'aug', 'mum', 'hoe', 'bah',
    #       'hal', 'keg', 'hew', 'zed', 'tow', 'gog', 'ass', 'dem', 'who', 'bet', 'gos', 'son', 'ear',
    #       'spy', 'kit', 'boy', 'due', 'sen', 'oaf', 'mix', 'hep', 'fur', 'ada', 'bin', 'nil', 'mia',
    #       'ewe', 'hit', 'fix', 'sad', 'rib', 'eye', 'hop', 'haw', 'wax', 'mid', 'tad', 'ken', 'wad',
    #       'rye', 'pap', 'bog', 'gut', 'ito', 'woe', 'our', 'ado', 'sin', 'mad', 'ray', 'hon', 'roy',
    #       'dip', 'hen', 'iva', 'lug', 'asp', 'hui', 'yak', 'bay', 'poi', 'yep', 'bun', 'try', 'lad',
    #       'elm', 'nat', 'wyo', 'gym', 'dug', 'toe', 'dee', 'wig', 'sly', 'rip', 'geo', 'cog', 'pas',
    #       'zen', 'odd', 'nan', 'lay', 'pod', 'fit', 'hem', 'joy', 'bum', 'rio', 'yon', 'dec', 'leg',
    #       'put', 'sue', 'dim', 'pet', 'yaw', 'nub', 'bit', 'bur', 'sid', 'sun', 'oil', 'red', 'doc',
    #       'moe', 'caw', 'eel', 'dix', 'cub', 'end', 'gem', 'off', 'yew', 'hug', 'pop', 'tub', 'sgt',
    #       'lid', 'pun', 'ton', 'sol', 'din', 'yup', 'jab', 'pea', 'bug', 'gag', 'mil', 'jig', 'hub',
    #       'low', 'did', 'tin', 'get', 'gte', 'sox', 'lei', 'mig', 'fig', 'lon', 'use', 'ban', 'flo',
    #       'nov', 'jut', 'bag', 'mir', 'sty', 'lap', 'two', 'ins', 'con', 'ant', 'net', 'tux', 'ode',
    #       'stu', 'mug', 'cad', 'nap', 'gun', 'fop', 'tot', 'sow', 'sal', 'sic', 'ted', 'wot', 'del',
    #       'imp', 'cob', 'way', 'ann', 'tan', 'mci', 'job', 'wet', 'ism', 'err', 'him', 'all', 'pad',
    #       'hah', 'hie', 'aim', 'ike', 'jed', 'ego', 'mac', 'baa', 'min', 'com', 'ill', 'was', 'cab',
    #       'ago', 'ina', 'big', 'ilk', 'gal', 'tap', 'duh', 'ola', 'ran', 'lab', 'top', 'gob', 'hot',
    #       'ora', 'tia', 'kip', 'han', 'met', 'hut', 'she', 'sac', 'fed', 'goo', 'tee', 'ell', 'not',
    #       'act', 'gil', 'rut', 'ala', 'ape', 'rig', 'cid', 'god', 'duo', 'lin', 'aid', 'gel', 'awl',
    #       'lag', 'elf', 'liz', 'ref', 'aha', 'fib', 'oho', 'tho', 'her', 'nor', 'ace', 'adz', 'fun',
    #       'ned', 'coo', 'win', 'tao', 'coy', 'van', 'man', 'pit', 'guy', 'foe', 'hid', 'mai', 'sup',
    #       'jay', 'hob', 'mow', 'jot', 'are', 'pol', 'arc', 'lax', 'aft', 'alb', 'len', 'air', 'pug',
    #       'pox', 'vow', 'got', 'meg', 'zoe', 'amp', 'ale', 'bud', 'gee', 'pin', 'dun', 'pat', 'ten',
    #       'mob'
    #     ]
    #   }

    #   it do
    #     is_expected.to match_array([
    #       ["cet", "cat", "can", "ian", "inn", "ins", "its", "ito", "ibo", "ibm", "ism"],
    #       ["cet", "cot", "con", "ion", "inn", "ins", "its", "ito", "ibo", "ibm", "ism"],
    #       ["cet", "get", "gee", "gte", "ate", "ats", "its", "ito", "ibo", "ibm", "ism"]
    #     ])
    #   end
    # end

    # context 'ex7' do
    #   let(:begin_word) { 'sand' }
    #   let(:end_word) { 'acne' }
    #   let(:word_list) {
    #     [
    #       'gslit', 'bunk', 'wars', 'ping', 'viva', 'wynn', 'wows', 'irks', 'gang', 'pool', 'mock', 'fort',
    #       'gsend', 'ship', 'cols', 'alec', 'foal', 'nabs', 'gaze', 'giza', 'mays', 'dogs', 'karo', 'cums',
    #       'gjedi', 'webb', 'lend', 'mire', 'jose', 'catt', 'grow', 'toss', 'magi', 'leis', 'bead', 'kara',
    #       'ghoof', 'than', 'ires', 'baas', 'vein', 'kari', 'riga', 'oars', 'gags', 'thug', 'yawn', 'wive',
    #       'gview', 'germ', 'flab', 'july', 'tuck', 'rory', 'bean', 'feed', 'rhee', 'jeez', 'gobs', 'lath',
    #       'gdesk', 'yoko', 'cute', 'zeus', 'thus', 'dims', 'link', 'dirt', 'mara', 'disc', 'limy', 'lewd',
    #       'gmaud', 'duly', 'elsa', 'hart', 'rays', 'rues', 'camp', 'lack', 'okra', 'tome', 'math', 'plug',
    #       'gmonk', 'orly', 'friz', 'hogs', 'yoda', 'poop', 'tick', 'plod', 'cloy', 'pees', 'imps', 'lead',
    #       'gpope', 'mall', 'frey', 'been', 'plea', 'poll', 'male', 'teak', 'soho', 'glob', 'bell', 'mary',
    #       'ghail', 'scan', 'yips', 'like', 'mull', 'kory', 'odor', 'byte', 'kaye', 'word', 'honk', 'asks',
    #       'gslid', 'hopi', 'toke', 'gore', 'flew', 'tins', 'mown', 'oise', 'hall', 'vega', 'sing', 'fool',
    #       'gbobs', 'lain', 'soft', 'hard', 'rots', 'sees', 'apex', 'chan', 'told', 'woos', 'unit', 'scow',
    #       'ggilt', 'beef', 'jars', 'tyre', 'imus', 'neon', 'soap', 'dabs', 'rein', 'ovid', 'hose', 'husk',
    #       'gloll', 'asia', 'cope', 'tail', 'hazy', 'clad', 'lash', 'sags', 'moll', 'eddy', 'fuel', 'lift',
    #       'gflog', 'land', 'sigh', 'saks', 'sail', 'hook', 'visa', 'tier', 'maws', 'roeg', 'gila', 'eyes',
    #       'gnoah', 'hypo', 'tore', 'eggs', 'rove', 'chap', 'room', 'wait', 'lurk', 'race', 'host', 'heel',
    #       'gdada', 'lola', 'gabs', 'sobs', 'joel', 'keck', 'axed', 'mead', 'gust', 'laid', 'ends', 'oort',
    #       'gnose', 'peer', 'kept', 'abet', 'iran', 'mick', 'dead', 'hags', 'tens', 'gown', 'sick', 'odis',
    #       'gmiro', 'bill', 'fawn', 'sumo', 'kilt', 'huge', 'ores', 'oran', 'flag', 'tost', 'seth', 'sift',
    #       'gpoet', 'reds', 'pips', 'cape', 'togo', 'wale', 'limn', 'toll', 'ploy', 'inns', 'snag', 'hoes',
    #       'gjerk', 'flux', 'fido', 'zane', 'arab', 'gamy', 'raze', 'lank', 'hurt', 'rail', 'hind', 'hoot',
    #       'gdogy', 'away', 'pest', 'hoed', 'pose', 'lose', 'pole', 'alva', 'dino', 'kind', 'clan', 'dips',
    #       'gsoup', 'veto', 'edna', 'damp', 'gush', 'amen', 'wits', 'pubs', 'fuzz', 'cash', 'pine', 'trod',
    #       'ggunk', 'nude', 'lost', 'rite', 'cory', 'walt', 'mica', 'cart', 'avow', 'wind', 'book', 'leon',
    #       'glife', 'bang', 'draw', 'leek', 'skis', 'dram', 'ripe', 'mine', 'urea', 'tiff', 'over', 'gale',
    #       'gweir', 'defy', 'norm', 'tull', 'whiz', 'gill', 'ward', 'crag', 'when', 'mill', 'firs', 'sans',
    #       'gflue', 'reid', 'ekes', 'jain', 'mutt', 'hems', 'laps', 'piss', 'pall', 'rowe', 'prey', 'cull',
    #       'gknew', 'size', 'wets', 'hurl', 'wont', 'suva', 'girt', 'prys', 'prow', 'warn', 'naps', 'gong',
    #       'gthru', 'livy', 'boar', 'sade', 'amok', 'vice', 'slat', 'emir', 'jade', 'karl', 'loyd', 'cerf',
    #       'gbess', 'loss', 'rums', 'lats', 'bode', 'subs', 'muss', 'maim', 'kits', 'thin', 'york', 'punt',
    #       'ggays', 'alpo', 'aids', 'drag', 'eras', 'mats', 'pyre', 'clot', 'step', 'oath', 'lout', 'wary',
    #       'gcarp', 'hums', 'tang', 'pout', 'whip', 'fled', 'omar', 'such', 'kano', 'jake', 'stan', 'loop',
    #       'gfuss', 'mini', 'byrd', 'exit', 'fizz', 'lire', 'emil', 'prop', 'noes', 'awed', 'gift', 'soli',
    #       'gsale', 'gage', 'orin', 'slur', 'limp', 'saar', 'arks', 'mast', 'gnat', 'port', 'into', 'geed',
    #       'gpave', 'awls', 'cent', 'cunt', 'full', 'dint', 'hank', 'mate', 'coin', 'tars', 'scud', 'veer',
    #       'gcoax', 'bops', 'uris', 'loom', 'shod', 'crib', 'lids', 'drys', 'fish', 'edit', 'dick', 'erna',
    #       'gelse', 'hahs', 'alga', 'moho', 'wire', 'fora', 'tums', 'ruth', 'bets', 'duns', 'mold', 'mush',
    #       'gswop', 'ruby', 'bolt', 'nave', 'kite', 'ahem', 'brad', 'tern', 'nips', 'whew', 'bait', 'ooze',
    #       'ggino', 'yuck', 'drum', 'shoe', 'lobe', 'dusk', 'cult', 'paws', 'anew', 'dado', 'nook', 'half',
    #       'glams', 'rich', 'cato', 'java', 'kemp', 'vain', 'fees', 'sham', 'auks', 'gish', 'fire', 'elam',
    #       'gsalt', 'sour', 'loth', 'whit', 'yogi', 'shes', 'scam', 'yous', 'lucy', 'inez', 'geld', 'whig',
    #       'gthee', 'kelp', 'loaf', 'harm', 'tomb', 'ever', 'airs', 'page', 'laud', 'stun', 'paid', 'goop',
    #       'gcobs', 'judy', 'grab', 'doha', 'crew', 'item', 'fogs', 'tong', 'blip', 'vest', 'bran', 'wend',
    #       'gbawl', 'feel', 'jets', 'mixt', 'tell', 'dire', 'devi', 'milo', 'deng', 'yews', 'weak', 'mark',
    #       'gdoug', 'fare', 'rigs', 'poke', 'hies', 'sian', 'suez', 'quip', 'kens', 'lass', 'zips', 'elva',
    #       'gbrat', 'cosy', 'teri', 'hull', 'spun', 'russ', 'pupa', 'weed', 'pulp', 'main', 'grim', 'hone',
    #       'gcord', 'barf', 'olav', 'gaps', 'rote', 'wilt', 'lars', 'roll', 'balm', 'jana', 'give', 'eire',
    #       'gfaun', 'suck', 'kegs', 'nita', 'weer', 'tush', 'spry', 'loge', 'nays', 'heir', 'dope', 'roar',
    #       'gpeep', 'nags', 'ates', 'bane', 'seas', 'sign', 'fred', 'they', 'lien', 'kiev', 'fops', 'said',
    #       'glawn', 'lind', 'miff', 'mass', 'trig', 'sins', 'furl', 'ruin', 'sent', 'cray', 'maya', 'clog',
    #       'gpuns', 'silk', 'axis', 'grog', 'jots', 'dyer', 'mope', 'rand', 'vend', 'keen', 'chou', 'dose',
    #       'grain', 'eats', 'sped', 'maui', 'evan', 'time', 'todd', 'skit', 'lief', 'sops', 'outs', 'moot',
    #       'gfaze', 'biro', 'gook', 'fill', 'oval', 'skew', 'veil', 'born', 'slob', 'hyde', 'twin', 'eloy',
    #       'gbeat', 'ergs', 'sure', 'kobe', 'eggo', 'hens', 'jive', 'flax', 'mons', 'dunk', 'yest', 'begs',
    #       'gdial', 'lodz', 'burp', 'pile', 'much', 'dock', 'rene', 'sago', 'racy', 'have', 'yalu', 'glow',
    #       'gmove', 'peps', 'hods', 'kins', 'salk', 'hand', 'cons', 'dare', 'myra', 'sega', 'type', 'mari',
    #       'gpelt', 'hula', 'gulf', 'jugs', 'flay', 'fest', 'spat', 'toms', 'zeno', 'taps', 'deny', 'swag',
    #       'gafro', 'baud', 'jabs', 'smut', 'egos', 'lara', 'toes', 'song', 'fray', 'luis', 'brut', 'olen',
    #       'gmere', 'ruff', 'slum', 'glad', 'buds', 'silt', 'rued', 'gelt', 'hive', 'teem', 'ides', 'sink',
    #       'gands', 'wisp', 'omen', 'lyre', 'yuks', 'curb', 'loam', 'darn', 'liar', 'pugs', 'pane', 'carl',
    #       'gsang', 'scar', 'zeds', 'claw', 'berg', 'hits', 'mile', 'lite', 'khan', 'erik', 'slug', 'loon',
    #       'gdena', 'ruse', 'talk', 'tusk', 'gaol', 'tads', 'beds', 'sock', 'howe', 'gave', 'snob', 'ahab',
    #       'gpart', 'meir', 'jell', 'stir', 'tels', 'spit', 'hash', 'omit', 'jinx', 'lyra', 'puck', 'laue',
    #       'gbeep', 'eros', 'owed', 'cede', 'brew', 'slue', 'mitt', 'jest', 'lynx', 'wads', 'gena', 'dank',
    #       'gvolt', 'gray', 'pony', 'veld', 'bask', 'fens', 'argo', 'work', 'taxi', 'afar', 'boon', 'lube',
    #       'gpass', 'lazy', 'mist', 'blot', 'mach', 'poky', 'rams', 'sits', 'rend', 'dome', 'pray', 'duck',
    #       'ghers', 'lure', 'keep', 'gory', 'chat', 'runt', 'jams', 'lays', 'posy', 'bats', 'hoff', 'rock',
    #       'gkeri', 'raul', 'yves', 'lama', 'ramp', 'vote', 'jody', 'pock', 'gist', 'sass', 'iago', 'coos',
    #       'grank', 'lowe', 'vows', 'koch', 'taco', 'jinn', 'juno', 'rape', 'band', 'aces', 'goal', 'huck',
    #       'glila', 'tuft', 'swan', 'blab', 'leda', 'gems', 'hide', 'tack', 'porn', 'scum', 'frat', 'plum',
    #       'gduds', 'shad', 'arms', 'pare', 'chin', 'gain', 'knee', 'foot', 'line', 'dove', 'vera', 'jays',
    #       'gfund', 'reno', 'skid', 'boys', 'corn', 'gwyn', 'sash', 'weld', 'ruiz', 'dior', 'jess', 'leaf',
    #       'gpars', 'cote', 'zing', 'scat', 'nice', 'dart', 'only', 'owls', 'hike', 'trey', 'whys', 'ding',
    #       'gklan', 'ross', 'barb', 'ants', 'lean', 'dopy', 'hock', 'tour', 'grip', 'aldo', 'whim', 'prom',
    #       'grear', 'dins', 'duff', 'dell', 'loch', 'lava', 'sung', 'yank', 'thar', 'curl', 'venn', 'blow',
    #       'gpomp', 'heat', 'trap', 'dali', 'nets', 'seen', 'gash', 'twig', 'dads', 'emmy', 'rhea', 'navy',
    #       'ghaws', 'mite', 'bows', 'alas', 'ives', 'play', 'soon', 'doll', 'chum', 'ajar', 'foam', 'call',
    #       'gpuke', 'kris', 'wily', 'came', 'ales', 'reef', 'raid', 'diet', 'prod', 'prut', 'loot', 'soar',
    #       'gcoed', 'celt', 'seam', 'dray', 'lump', 'jags', 'nods', 'sole', 'kink', 'peso', 'howl', 'cost',
    #       'gtsar', 'uric', 'sore', 'woes', 'sewn', 'sake', 'cask', 'caps', 'burl', 'tame', 'bulk', 'neva',
    #       'gfrom', 'meet', 'webs', 'spar', 'fuck', 'buoy', 'wept', 'west', 'dual', 'pica', 'sold', 'seed',
    #       'ggads', 'riff', 'neck', 'deed', 'rudy', 'drop', 'vale', 'flit', 'romp', 'peak', 'jape', 'jews',
    #       'gfain', 'dens', 'hugo', 'elba', 'mink', 'town', 'clam', 'feud', 'fern', 'dung', 'newt', 'mime',
    #       'gdeem', 'inti', 'gigs', 'sosa', 'lope', 'lard', 'cara', 'smug', 'lego', 'flex', 'doth', 'paar',
    #       'gmoon', 'wren', 'tale', 'kant', 'eels', 'muck', 'toga', 'zens', 'lops', 'duet', 'coil', 'gall',
    #       'gteal', 'glib', 'muir', 'ails', 'boer', 'them', 'rake', 'conn', 'neat', 'frog', 'trip', 'coma',
    #       'gmust', 'mono', 'lira', 'craw', 'sled', 'wear', 'toby', 'reel', 'hips', 'nate', 'pump', 'mont',
    #       'gdied', 'moss', 'lair', 'jibe', 'oils', 'pied', 'hobs', 'cads', 'haze', 'muse', 'cogs', 'figs',
    #       'gcues', 'roes', 'whet', 'boru', 'cozy', 'amos', 'tans', 'news', 'hake', 'cots', 'boas', 'tutu',
    #       'gwavy', 'pipe', 'typo', 'albs', 'boom', 'dyke', 'wail', 'woke', 'ware', 'rita', 'fail', 'slab',
    #       'gowes', 'jane', 'rack', 'hell', 'lags', 'mend', 'mask', 'hume', 'wane', 'acne', 'team', 'holy',
    #       'gruns', 'exes', 'dole', 'trim', 'zola', 'trek', 'puma', 'wacs', 'veep', 'yaps', 'sums', 'lush',
    #       'gtubs', 'most', 'witt', 'bong', 'rule', 'hear', 'awry', 'sots', 'nils', 'bash', 'gasp', 'inch',
    #       'gpens', 'fies', 'juts', 'pate', 'vine', 'zulu', 'this', 'bare', 'veal', 'josh', 'reek', 'ours',
    #       'gcowl', 'club', 'farm', 'teat', 'coat', 'dish', 'fore', 'weft', 'exam', 'vlad', 'floe', 'beak',
    #       'glane', 'ella', 'warp', 'goth', 'ming', 'pits', 'rent', 'tito', 'wish', 'amps', 'says', 'hawk',
    #       'gways', 'punk', 'nark', 'cagy', 'east', 'paul', 'bose', 'solo', 'teed', 'text', 'hews', 'snip',
    #       'glips', 'emit', 'orgy', 'icon', 'tuna', 'soul', 'kurd', 'clod', 'calk', 'aunt', 'bake', 'copy',
    #       'gacid', 'duse', 'kiln', 'spec', 'fans', 'bani', 'irma', 'pads', 'batu', 'logo', 'pack', 'oder',
    #       'gatop', 'funk', 'gide', 'bede', 'bibs', 'taut', 'guns', 'dana', 'puff', 'lyme', 'flat', 'lake',
    #       'gjune', 'sets', 'gull', 'hops', 'earn', 'clip', 'fell', 'kama', 'seal', 'diaz', 'cite', 'chew',
    #       'gcuba', 'bury', 'yard', 'bank', 'byes', 'apia', 'cree', 'nosh', 'judo', 'walk', 'tape', 'taro',
    #       'gboot', 'cods', 'lade', 'cong', 'deft', 'slim', 'jeri', 'rile', 'park', 'aeon', 'fact', 'slow',
    #       'ggoff', 'cane', 'earp', 'tart', 'does', 'acts', 'hope', 'cant', 'buts', 'shin', 'dude', 'ergo',
    #       'gmode', 'gene', 'lept', 'chen', 'beta', 'eden', 'pang', 'saab', 'fang', 'whir', 'cove', 'perk',
    #       'gfads', 'rugs', 'herb', 'putt', 'nous', 'vane', 'corm', 'stay', 'bids', 'vela', 'roof', 'isms',
    #       'gsics', 'gone', 'swum', 'wiry', 'cram', 'rink', 'pert', 'heap', 'sikh', 'dais', 'cell', 'peel',
    #       'gnuke', 'buss', 'rasp', 'none', 'slut', 'bent', 'dams', 'serb', 'dork', 'bays', 'kale', 'cora',
    #       'gwake', 'welt', 'rind', 'trot', 'sloe', 'pity', 'rout', 'eves', 'fats', 'furs', 'pogo', 'beth',
    #       'ghued', 'edam', 'iamb', 'glee', 'lute', 'keel', 'airy', 'easy', 'tire', 'rube', 'bogy', 'sine',
    #       'gchop', 'rood', 'elbe', 'mike', 'garb', 'jill', 'gaul', 'chit', 'dons', 'bars', 'ride', 'beck',
    #       'gtoad', 'make', 'head', 'suds', 'pike', 'snot', 'swat', 'peed', 'same', 'gaza', 'lent', 'gait',
    #       'ggael', 'elks', 'hang', 'nerf', 'rosy', 'shut', 'glop', 'pain', 'dion', 'deaf', 'hero', 'doer',
    #       'gwost', 'wage', 'wash', 'pats', 'narc', 'ions', 'dice', 'quay', 'vied', 'eons', 'case', 'pour',
    #       'gurns', 'reva', 'rags', 'aden', 'bone', 'rang', 'aura', 'iraq', 'toot', 'rome', 'hals', 'megs',
    #       'gpond', 'john', 'yeps', 'pawl', 'warm', 'bird', 'tint', 'jowl', 'gibe', 'come', 'hold', 'pail',
    #       'gwipe', 'bike', 'rips', 'eery', 'kent', 'hims', 'inks', 'fink', 'mott', 'ices', 'macy', 'serf',
    #       'gkeys', 'tarp', 'cops', 'sods', 'feet', 'tear', 'benz', 'buys', 'colo', 'boil', 'sews', 'enos',
    #       'gwatt', 'pull', 'brag', 'cork', 'save', 'mint', 'feat', 'jamb', 'rubs', 'roxy', 'toys', 'nosy',
    #       'gyowl', 'tamp', 'lobs', 'foul', 'doom', 'sown', 'pigs', 'hemp', 'fame', 'boor', 'cube', 'tops',
    #       'gloco', 'lads', 'eyre', 'alta', 'aged', 'flop', 'pram', 'lesa', 'sawn', 'plow', 'aral', 'load',
    #       'glied', 'pled', 'boob', 'bert', 'rows', 'zits', 'rick', 'hint', 'dido', 'fist', 'marc', 'wuss',
    #       'gnode', 'smog', 'nora', 'shim', 'glut', 'bale', 'perl', 'what', 'tort', 'meek', 'brie', 'bind',
    #       'gcake', 'psst', 'dour', 'jove', 'tree', 'chip', 'stud', 'thou', 'mobs', 'sows', 'opts', 'diva',
    #       'gperm', 'wise', 'cuds', 'sols', 'alan', 'mild', 'pure', 'gail', 'wins', 'offs', 'nile', 'yelp',
    #       'gminn', 'tors', 'tran', 'homy', 'sadr', 'erse', 'nero', 'scab', 'finn', 'mich', 'turd', 'then',
    #       'gpoem', 'noun', 'oxus', 'brow', 'door', 'saws', 'eben', 'wart', 'wand', 'rosa', 'left', 'lina',
    #       'gcabs', 'rapt', 'olin', 'suet', 'kalb', 'mans', 'dawn', 'riel', 'temp', 'chug', 'peal', 'drew',
    #       'gnull', 'hath', 'many', 'took', 'fond', 'gate', 'sate', 'leak', 'zany', 'vans', 'mart', 'hess',
    #       'ghome', 'long', 'dirk', 'bile', 'lace', 'moog', 'axes', 'zone', 'fork', 'duct', 'rico', 'rife',
    #       'gdeep', 'tiny', 'hugh', 'bilk', 'waft', 'swig', 'pans', 'with', 'kern', 'busy', 'film', 'lulu',
    #       'gking', 'lord', 'veda', 'tray', 'legs', 'soot', 'ells', 'wasp', 'hunt', 'earl', 'ouch', 'diem',
    #       'gyell', 'pegs', 'blvd', 'polk', 'soda', 'zorn', 'liza', 'slop', 'week', 'kill', 'rusk', 'eric',
    #       'gsump', 'haul', 'rims', 'crop', 'blob', 'face', 'bins', 'read', 'care', 'pele', 'ritz', 'beau',
    #       'ggolf', 'drip', 'dike', 'stab', 'jibs', 'hove', 'junk', 'hoax', 'tats', 'fief', 'quad', 'boat',
    #       'gpeat', 'ream', 'hats', 'root', 'flak', 'grit', 'clap', 'pugh', 'bosh', 'lock', 'mute', 'crow',
    #       'giced', 'lisa', 'bela', 'fems', 'oxes', 'vies', 'gybe', 'huff', 'bull', 'cuss', 'sunk', 'pups',
    #       'gfobs', 'turf', 'sect', 'atom', 'debt', 'sane', 'writ', 'anon', 'mayo', 'aria', 'seer', 'thor',
    #       'gbrim', 'gawk', 'jack', 'jazz', 'menu', 'yolk', 'surf', 'libs', 'lets', 'bans', 'toil', 'open',
    #       'gaced', 'poor', 'mess', 'wham', 'fran', 'gina', 'dote', 'love', 'mood', 'pale', 'reps', 'ines',
    #       'gshot', 'alar', 'twit', 'site', 'dill', 'yoga', 'sear', 'vamp', 'abel', 'lieu', 'cuff', 'orbs',
    #       'grose', 'tank', 'gape', 'guam', 'adar', 'vole', 'your', 'dean', 'dear', 'hebe', 'crab', 'hump',
    #       'gmole', 'vase', 'rode', 'dash', 'sera', 'balk', 'lela', 'inca', 'gaea', 'bush', 'loud', 'pies',
    #       'gaide', 'blew', 'mien', 'side', 'kerr', 'ring', 'tess', 'prep', 'rant', 'lugs', 'hobo', 'joke',
    #       'godds', 'yule', 'aida', 'true', 'pone', 'lode', 'nona', 'weep', 'coda', 'elmo', 'skim', 'wink',
    #       'gbras', 'pier', 'bung', 'pets', 'tabs', 'ryan', 'jock', 'body', 'sofa', 'joey', 'zion', 'mace',
    #       'gkick', 'vile', 'leno', 'bali', 'fart', 'that', 'redo', 'ills', 'jogs', 'pent', 'drub', 'slaw',
    #       'gtide', 'lena', 'seep', 'gyps', 'wave', 'amid', 'fear', 'ties', 'flan', 'wimp', 'kali', 'shun',
    #       'gcrap', 'sage', 'rune', 'logs', 'cain', 'digs', 'abut', 'obit', 'paps', 'rids', 'fair', 'hack',
    #       'ghuns', 'road', 'caws', 'curt', 'jute', 'fisk', 'fowl', 'duty', 'holt', 'miss', 'rude', 'vito',
    #       'gbaal', 'ural', 'mann', 'mind', 'belt', 'clem', 'last', 'musk', 'roam', 'abed', 'days', 'bore',
    #       'gfuze', 'fall', 'pict', 'dump', 'dies', 'fiat', 'vent', 'pork', 'eyed', 'docs', 'rive', 'spas',
    #       'grope', 'ariz', 'tout', 'game', 'jump', 'blur', 'anti', 'lisp', 'turn', 'sand', 'food', 'moos',
    #       'ghoop', 'saul', 'arch', 'fury', 'rise', 'diss', 'hubs', 'burs', 'grid', 'ilks', 'suns', 'flea',
    #       'gsoil', 'lung', 'want', 'nola', 'fins', 'thud', 'kidd', 'juan', 'heps', 'nape', 'rash', 'burt',
    #       'gbump', 'tots', 'brit', 'mums', 'bole', 'shah', 'tees', 'skip', 'limb', 'umps', 'ache', 'arcs',
    #       'graft', 'halo', 'luce', 'bahs', 'leta', 'conk', 'duos', 'siva', 'went', 'peek', 'sulk', 'reap',
    #       'gfree', 'dubs', 'lang', 'toto', 'hasp', 'ball', 'rats', 'nair', 'myst', 'wang', 'snug', 'nash',
    #       'glaos', 'ante', 'opal', 'tina', 'pore', 'bite', 'haas', 'myth', 'yugo', 'foci', 'dent', 'bade',
    #       'gpear', 'mods', 'auto', 'shop', 'etch', 'lyly', 'curs', 'aron', 'slew', 'tyro', 'sack', 'wade',
    #       'gclio', 'gyro', 'butt', 'icky', 'char', 'itch', 'halt', 'gals', 'yang', 'tend', 'pact', 'bees',
    #       'gsuit', 'puny', 'hows', 'nina', 'brno', 'oops', 'lick', 'sons', 'kilo', 'bust', 'nome', 'mona',
    #       'gdull', 'join', 'hour', 'papa', 'stag', 'bern', 'wove', 'lull', 'slip', 'laze', 'roil', 'alto',
    #       'gbath', 'buck', 'alma', 'anus', 'evil', 'dumb', 'oreo', 'rare', 'near', 'cure', 'isis', 'hill',
    #       'gkyle', 'pace', 'comb', 'nits', 'flip', 'clop', 'mort', 'thea', 'wall', 'kiel', 'judd', 'coop',
    #       'gdave', 'very', 'amie', 'blah', 'flub', 'talc', 'bold', 'fogy', 'idea', 'prof', 'horn', 'shoo',
    #       'gaped', 'pins', 'helm', 'wees', 'beer', 'womb', 'clue', 'alba', 'aloe', 'fine', 'bard', 'limo',
    #       'gshaw', 'pint', 'swim', 'dust', 'indy', 'hale', 'cats', 'troy', 'wens', 'luke', 'vern', 'deli',
    #       'gboth', 'brig', 'daub', 'sara', 'sued', 'bier', 'noel', 'olga', 'dupe', 'look', 'pisa', 'knox',
    #       'gmurk', 'dame', 'matt', 'gold', 'jame', 'toge', 'luck', 'peck', 'tass', 'calf', 'pill', 'wore',
    #       'gwadi', 'thur', 'parr', 'maul', 'tzar', 'ones', 'lees', 'dark', 'fake', 'bast', 'zoom', 'here',
    #       'gmoro', 'wine', 'bums', 'cows', 'jean', 'palm', 'fume', 'plop', 'help', 'tuba', 'leap', 'cans',
    #       'gback', 'avid', 'lice', 'lust', 'polo', 'dory', 'stew', 'kate', 'rama', 'coke', 'bled', 'mugs',
    #       'gajax', 'arts', 'drug', 'pena', 'cody', 'hole', 'sean', 'deck', 'guts', 'kong', 'bate', 'pitt',
    #       'gcomo', 'lyle', 'siam', 'rook', 'baby', 'jigs', 'bret', 'bark', 'lori', 'reba', 'sups', 'made',
    #       'gbuzz', 'gnaw', 'alps', 'clay', 'post', 'viol', 'dina', 'card', 'lana', 'doff', 'yups', 'tons',
    #       'glive', 'kids', 'pair', 'yawl', 'name', 'oven', 'sirs', 'gyms', 'prig', 'down', 'leos', 'noon',
    #       'gnibs', 'cook', 'safe', 'cobb', 'raja', 'awes', 'sari', 'nerd', 'fold', 'lots', 'pete', 'deal',
    #       'gbias', 'zeal', 'girl', 'rage', 'cool', 'gout', 'whey', 'soak', 'thaw', 'bear', 'wing', 'nagy',
    #       'gwell', 'oink', 'sven', 'kurt', 'etna', 'held', 'wood', 'high', 'feta', 'twee', 'ford', 'cave',
    #       'gknot', 'tory', 'ibis', 'yaks', 'vets', 'foxy', 'sank', 'cone', 'pius', 'tall', 'seem', 'wool',
    #       'gflap', 'gird', 'lore', 'coot', 'mewl', 'sere', 'real', 'puts', 'sell', 'nuts', 'foil', 'lilt',
    #       'gsaga', 'heft', 'dyed', 'goat', 'spew', 'daze', 'frye', 'adds', 'glen', 'tojo', 'pixy', 'gobi',
    #       'gstop', 'tile', 'hiss', 'shed', 'hahn', 'baku', 'ahas', 'sill', 'swap', 'also', 'carr', 'manx',
    #       'glime', 'debs', 'moat', 'eked', 'bola', 'pods', 'coon', 'lacy', 'tube', 'minx', 'buff', 'pres',
    #       'gclew', 'gaff', 'flee', 'burn', 'whom', 'cola', 'fret', 'purl', 'wick', 'wigs', 'donn', 'guys',
    #       'gtoni', 'oxen', 'wite', 'vial', 'spam', 'huts', 'vats', 'lima', 'core', 'eula', 'thad', 'peon',
    #       'gerie', 'oats', 'boyd', 'cued', 'olaf', 'tams', 'secs', 'urey', 'wile', 'penn', 'bred', 'rill',
    #       'gvary', 'sues', 'mail', 'feds', 'aves', 'code', 'beam', 'reed', 'neil', 'hark', 'pols', 'gris',
    #       'ggods', 'mesa', 'test', 'coup', 'heed', 'dora', 'hied', 'tune', 'doze', 'pews', 'oaks', 'bloc',
    #       'gtips', 'maid', 'goof', 'four', 'woof', 'silo', 'bray', 'zest', 'kiss', 'yong', 'file', 'hilt',
    #       'giris', 'tuns', 'lily', 'ears', 'pant', 'jury', 'taft', 'data', 'gild', 'pick', 'kook', 'colt',
    #       'gbohr', 'anal', 'asps', 'babe', 'bach', 'mash', 'biko', 'bowl', 'huey', 'jilt', 'goes', 'guff',
    #       'gbend', 'nike', 'tami', 'gosh', 'tike', 'gees', 'urge', 'path', 'bony', 'jude', 'lynn', 'lois',
    #       'gteas', 'dunn', 'elul', 'bonn', 'moms', 'bugs', 'slay', 'yeah', 'loan', 'hulk', 'lows', 'damn',
    #       'gnell', 'jung', 'avis', 'mane', 'waco', 'loin', 'knob', 'tyke', 'anna', 'hire', 'luau', 'tidy',
    #       'gnuns', 'pots', 'quid', 'exec', 'hans', 'hera', 'hush', 'shag', 'scot', 'moan', 'wald', 'ursa',
    #       'glorn', 'hunk', 'loft', 'yore', 'alum', 'mows', 'slog', 'emma', 'spud', 'rice', 'worn', 'erma',
    #       'gneed', 'bags', 'lark', 'kirk', 'pooh', 'dyes', 'area', 'dime', 'luvs', 'foch', 'refs', 'cast',
    #       'galit', 'tugs', 'even', 'role', 'toed', 'caph', 'nigh', 'sony', 'bide', 'robs', 'folk', 'daft',
    #       'gpast', 'blue', 'flaw', 'sana', 'fits', 'barr', 'riot', 'dots', 'lamp', 'cock', 'fibs', 'harp',
    #       'gtent', 'hate', 'mali', 'togs', 'gear', 'tues', 'bass', 'pros', 'numb', 'emus', 'hare', 'fate',
    #       'gwife', 'mean', 'pink', 'dune', 'ares', 'dine', 'oily', 'tony', 'czar', 'spay', 'push', 'glum',
    #       'gtill', 'moth', 'glue', 'dive', 'scad', 'pops', 'woks', 'andy', 'leah', 'cusp', 'hair', 'alex',
    #       'gvibe', 'bulb', 'boll', 'firm', 'joys', 'tara', 'cole', 'levy', 'owen', 'chow', 'rump', 'jail',
    #       'glapp', 'beet', 'slap', 'kith', 'more', 'maps', 'bond', 'hick', 'opus', 'rust', 'wist', 'shat',
    #       'gphil', 'snow', 'lott', 'lora', 'cary', 'mote', 'rift', 'oust', 'klee', 'goad', 'pith', 'heep',
    #       'glupe', 'ivan', 'mimi', 'bald', 'fuse', 'cuts', 'lens', 'leer', 'eyry', 'know', 'razz', 'tare',
    #       'gpals', 'geek', 'greg', 'teen', 'clef', 'wags', 'weal', 'each', 'haft', 'nova', 'waif', 'rate',
    #       'gkaty', 'yale', 'dale', 'leas', 'axum', 'quiz', 'pawn', 'fend', 'capt', 'laws', 'city', 'chad',
    #       'gcoal', 'nail', 'zaps', 'sort', 'loci', 'less', 'spur', 'note', 'foes', 'fags', 'gulp', 'snap',
    #       'gbogs', 'wrap', 'dane', 'melt', 'ease', 'felt', 'shea', 'calm', 'star', 'swam', 'aery', 'year',
    #       'gplan', 'odin', 'curd', 'mira', 'mops', 'shit', 'davy', 'apes', 'inky', 'hues', 'lome', 'bits',
    #       'gvila', 'show', 'best', 'mice', 'gins', 'next', 'roan', 'ymir', 'mars', 'oman', 'wild', 'heal',
    #       'gplus', 'erin', 'rave', 'robe', 'fast', 'hutu', 'aver', 'jodi', 'alms', 'yams', 'zero', 'revs',
    #       'gwean', 'chic', 'self', 'jeep', 'jobs', 'waxy', 'duel', 'seek', 'spot', 'raps', 'pimp', 'adan',
    #       'gslam', 'tool', 'morn', 'futz', 'ewes', 'errs', 'knit', 'rung', 'kans', 'muff', 'huhs', 'tows',
    #       'glest', 'meal', 'azov', 'gnus', 'agar', 'sips', 'sway', 'otis', 'tone', 'tate', 'epic', 'trio',
    #       'gtics', 'fade', 'lear', 'owns', 'robt', 'weds', 'five', 'lyon', 'terr', 'arno', 'mama', 'grey',
    #       'gdisk', 'sept', 'sire', 'bart', 'saps', 'whoa', 'turk', 'stow', 'pyle', 'joni', 'zinc', 'negs',
    #       'gtask', 'leif', 'ribs', 'malt', 'nine', 'bunt', 'grin', 'dona', 'nope', 'hams', 'some', 'molt',
    #       'gsmit', 'sacs', 'joan', 'slav', 'lady', 'base', 'heck', 'list', 'take', 'herd', 'will', 'nubs',
    #       'gburg', 'hugs', 'peru', 'coif', 'zoos', 'nick', 'idol', 'levi', 'grub', 'roth', 'adam', 'elma',
    #       'gtags', 'tote', 'yaws', 'cali', 'mete', 'lula', 'cubs', 'prim', 'luna', 'jolt', 'span', 'pita',
    #       'gdodo', 'puss', 'deer', 'term', 'dolt', 'goon', 'gary', 'yarn', 'aims', 'just', 'rena', 'tine',
    #       'gcyst', 'meld', 'loki', 'wong', 'were', 'hung', 'maze', 'arid', 'cars', 'wolf', 'marx', 'faye',
    #       'geave', 'raga', 'flow', 'neal', 'lone', 'anne', 'cage', 'tied', 'tilt', 'soto', 'opel', 'date',
    #       'gbuns', 'dorm', 'kane', 'akin', 'ewer', 'drab', 'thai', 'jeer', 'grad', 'berm', 'rods', 'saki',
    #       'ggrus', 'vast', 'late', 'lint', 'mule', 'risk', 'labs', 'snit', 'gala', 'find', 'spin', 'ired',
    #       'gslot', 'oafs', 'lies', 'mews', 'wino', 'milk', 'bout', 'onus', 'tram', 'jaws', 'peas', 'cleo',
    #       'gseat', 'gums', 'cold', 'vang', 'dewy', 'hood', 'rush', 'mack', 'yuan', 'odes', 'boos', 'jami',
    #       'gmare', 'plot', 'swab', 'borg', 'hays', 'form', 'mesh', 'mani', 'fife', 'good', 'gram', 'lion',
    #       'gmyna', 'moor', 'skin', 'posh', 'burr', 'rime', 'done', 'ruts', 'pays', 'stem', 'ting', 'arty',
    #       'gslag', 'iron', 'ayes', 'stub', 'oral', 'gets', 'chid', 'yens', 'snub', 'ages', 'wide', 'bail',
    #       'gverb', 'lamb', 'bomb', 'army', 'yoke', 'gels', 'tits', 'bork', 'mils', 'nary', 'barn', 'hype',
    #       'godom', 'avon', 'hewn', 'rios', 'cams', 'tact', 'boss', 'oleo', 'duke', 'eris', 'gwen', 'elms',
    #       'gdeon', 'sims', 'quit', 'nest', 'font', 'dues', 'yeas', 'zeta', 'bevy', 'gent', 'torn', 'cups',
    #       'gworm', 'baum', 'axon', 'purr', 'vise', 'grew', 'govs', 'meat', 'chef', 'rest', 'lame'
    #     ]
    #   }

    #   it { is_expected.to match_array([]) }
    # end
  end
end
