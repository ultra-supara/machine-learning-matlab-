%HPからwebスクレイピングをする
url = 'https://nips.cc/Conferences/2015/AcceptedPapers';

%restful web service from contents
papers = webread(url);

%文字列内のHTMLコードの解析
tree = htmltree(papers);

%HTMLツリー内の要素を検索する
subtree = findElement(tree, 'div.col-xs-12.col-sm-9 div div div');

%たいとると著者の抽出
totles = extractHTMLText(findElement(subtree, 'span. larger-font'))
authors = extractHTMLText(findElement(subtree, 'b'));
