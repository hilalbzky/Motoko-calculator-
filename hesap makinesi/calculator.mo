import Array "mo:base/Array"; 
import Result "mo:base/Result";

actor HesapMakinesi {
  stable var hucre: Int = 0; // Ana değişken
  stable var gecmis: [Int] = []; // İşlem geçmişi
  
  // İşlem geçmişine kayıt ekleme
  private func gecmiseEkle(islemSonucu: Int) {
    gecmis := Array.append(gecmis, [islemSonucu]); // Listeye öğe eklemek için Array.append kullanıyoruz
  };

  public func toplam(s: Int): async Int {
    hucre += s;
    gecmiseEkle(hucre);
    return hucre;
  };

  public func cikarma(s: Int): async Int {
    hucre -= s;
    gecmiseEkle(hucre);
    return hucre;
  };

  public func carpma(s: Int): async Int {
    hucre *= s;
    gecmiseEkle(hucre);
    return hucre;
  };

  public func bolme(s: Int): async Result.Result<Int, Text> {
    if (s == 0) {
      return #err("Hata: Sıfıra bölünemez.");
    };
    hucre /= s;
    gecmiseEkle(hucre);
    return #ok(hucre);
  };

  public func mod(s: Int): async Result.Result<Int, Text> {
    if (s == 0) {
      return #err("Hata: Sıfıra göre mod alınamaz.");
    };
    hucre := hucre % s;
    gecmiseEkle(hucre);
    return #ok(hucre);
  };

  public func temizle(): async () {
    gecmiseEkle(hucre); // Temizlenmiş hucreyi geçmişe ekleyelim
    hucre := 0;
  };

  public func durum(): async Int {
    return hucre;
  };

  public func gecmisiGoster(): async [Int] {
    return gecmis;
  };
};
