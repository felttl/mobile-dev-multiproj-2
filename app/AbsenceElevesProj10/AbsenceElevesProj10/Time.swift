//
//  Time.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// add modulus to int class (advanced modulus for negative numbers)
// i must creating /modify % operator
extension Int{
    // better than % symbol (for negative numbers)
  public static func mod(_  num:Int, _ mod : Int)->Int{
      var res : Int
      let times : Float = Float(num) / Float(mod)
      res = num - Int(floor(Float(times)/Float(mod))) * mod
      return res
  }
}



 class Time{
    // default region mod is ...


    public static var region_mod : [String] = ["GMT", "UTC", "CET"]
    public static let mods : [String] = ["Gregorian", "Maya"]
    public static var mod : String = "gregorian"
    // le language change all conversions
    public static var lang : String = "EN"
    public static var name_days : [String] = []
    // listes pour le nombre de jours par mois
    // février + 1 si bisextile
    public static var lesMoisNbJours = [31,28,31,30,31,30,31,31,30,31,30,31]
    // pour rentrer tout les noms des langues il faudrais faire une matrice
    // FR
    private static var LesJours = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"]
    private static var LesNomsMois = ["janvier","février","Mars","avril","Mai","juin","juillet","août","septembre","octobre","novembre","décembre"]
   // ancrage : (départ de tout les calculs)

   
    // 1000ms = une seconde
    public var ms : Int
    public var seconds : Int
    public var minutes : Int
    public var hours : Int
    public var days : Int
    public var months : Int
    public var years : Int


    // bouild an object
    public init(_ ms : Int=0,_ seconds : Int=0,_ minutes : Int=0,_ hours : Int=0,_ days : Int=0,_ months : Int=0,_ years : Int=0){
        self.ms = ms
        self.seconds = seconds
        self.minutes = minutes
        self.hours = hours
        self.days = days
        self.months = months
        self.years = years

    }
    // overload
    public init(_ seconds : Int=0,_ minutes : Int=0,_ hours : Int=0){
        self.seconds = seconds
        self.minutes = minutes
        self.hours = hours
        self.ms = 0
        self.days = 0
        self.months = 0
        self.years = 0
    }
  // create now time object
   public init(){
        self.hours   = (Calendar.current.component(.hour, from: Date()))
        self.minutes = (Calendar.current.component(.minute, from: Date()))
        self.seconds = (Calendar.current.component(.second, from: Date()))
        self.ms = 0
        self.days = (Calendar.current.component(.day, from: Date()))
        self.months = (Calendar.current.component(.month, from: Date()))
        self.years = (Calendar.current.component(.year, from: Date()))
    }



    // convert all into ms (more eazy to convert into any other units)
    public func convertMs()->Int{
        var res = 0
        res += self.ms
        res += Int(10e2)*self.seconds
        res += 60*Int(10e2)*self.minutes
        res += 36*Int(10e4)*self.hours
        res += 36*Int(10e4)*24*self.days
        // attention pas tout a fait 28 jours par mois
        res += 36*Int(10e4)*24*28*self.months
        res += 36*Int(10e4)*24*28*12*self.years
        return res
    }

    // réduit tout les débordement
    // exemple 389j = 1 an + ... mois etc...
    // fais les conversions en partant des nombres les plus petits vers les plus grands
    public func minimiseLeft(){
        // convertir unités actuelle en unités futur
        let convertisseur = [1000,60,60,24,29,12]
        var at_conv = [self.ms, self.seconds, self.minutes, self.hours, self.days, self.months, self.years]
        // propagation :
        for vec in 0...4{
            at_conv[vec+1] += Int(at_conv[vec]/convertisseur[vec])
            at_conv[vec] %= convertisseur[vec]
        }
        // bissextile :
        if (self.years > 0 || self.years < 0){
            // ajoute le nombre de jours nécessaires en partant de l'année zero
            self.days += Time.bissextile(self.years).count
        } else { // year zero is bissextile (?)
            self.days += 1
        }
        // conversion des jours :
        self.months = self.days2Months(self.days)

    }

    // convert days to months (with different numbers each months)
    // input is days output is months
    private func days2Months(_ days:Int)->Int{
        var res : Int = 0
        if (days != 0){
            // count full days to increment months
            var full : Int = 0
            var carry : Bool = true
            var idx : Int = 0
            while (carry && idx < 12){
                full += Time.lesMoisNbJours[idx]
                if (days < full){
                    carry = false
                } else if (days == full){
                    res += 1
                    carry = false
                } else {
                    res += 1
                }
                idx += 1
            }
            let tab : [Int] = Time.bissextile(self.years)
            if (self.years == tab[tab.count-1] && months >= 2){
              res += 1
            }
        }
        return res
    }
    private func months2Days(_ months:Int)->Int{
        var res : Int = 0
        if (months != 0){
            // count full days to increment months
            for i in 0...months-1{
              res += Time.lesMoisNbJours[i]
            }
            // must minimize before
            let tab : [Int] = Time.bissextile(self.years)
            if (self.years == tab[tab.count-1] && months >= 2){
              res += 1
            }
        }
        return res
    }


    public static func bissextile(_ to_date:Int)->[Int]{
        var res : [Int] = [0]
        //permet de faire le module de nombres négatifs
        let a: Int = (to_date >= 0) ? 1 : to_date
        let b: Int  = (to_date >= 0) ? to_date : -1
        // faire le module dans le bon sens
        if (to_date != 0){
            for i in a...b{
                if (i % 4 == 0 && i % 100 == 0 && i % 400 == 0 || i % 4 == 0 && i % 100 != 0){
                    res.append(i)
                }
            }
        }
        return res
    }

    // return string of time as format : "xx:xx:xx jj/mm/yyyy"
    public func getInString()->String{
        return "\(self.seconds):\(self.minutes):\(self.hours) \(self.days)/\(self.months)/\(self.years)"
    }

    // get epoch (date start at 1 jan 1970) in seconds
    // world's universal (Unix) time base
    private func getEpoch()->Float{
        return Float(NSDate().timeIntervalSince1970)
    }


    // renvoie une liste de nombre des années bissextiles entre la date 0 et la date choisie
    // 1/1/2020 -> 2 (mercredi)             lundi = 0
    // 1/1/2021 -> 4                        mardi = 1
    // 1/1/2022 -> 5                        mercredi = 2
    // 1/1/2023 -> 6                        jeudi = 3
    // 1/1/2024 -> 0                        vendredi = 4
                                         // samedi = 5
                                         // dimanche = 6


    // get number (0 to 6) of first day of the chosen year
    private func getFirstDayNameOfYear(_ yearNum: Int)->Int{
        var res : Int = 2
        // nombre d'années bissextiles entre les deux dates
        if (yearNum > 2020){
            let bissextilEquart = Time.bissextile(yearNum-1).count - 491
            res = (yearNum - 2018 + bissextilEquart + 1) % 7
        } else if (yearNum < 2020){
            let bissextilEquart = 490 - Time.bissextile(yearNum-1).count
            res = Int.mod(yearNum - 2018 - bissextilEquart, 7)
        }
        return res
    }

    // get the name of the day from date
    public func getDayName()->String{
        var res : String
        let index : Int
        // convert month number into days
        var fulldays : Int = self.days
        fulldays += self.months2Days(self.months)
        index = Int.mod(self.getFirstDayNameOfYear(self.years) + fulldays, 7)
        res = Time.LesJours[index]
        return res
    }


    // return now time
    public func getNow()->Time{
        var objreturntime : Time
        let hours   = (Calendar.current.component(.hour, from: Date()))
        let minutes = (Calendar.current.component(.minute, from: Date()))
        let seconds = (Calendar.current.component(.second, from: Date()))
        objreturntime = Time(seconds, minutes, hours)  // overload 2
        return objreturntime
    }

    // return ss:mm:hh dd/mm/yyyy
    public func getFullDate()->String{
        return "\(self.seconds):\(self.minutes):\(self.hours) \(self.getDate())"
    }

    // return dd/mm/yyyy
    public func getDate()->String{
        return "\(self.days)/\(self.months)/\(self.years)"
    }


    // convert all float time numbers into int numbers
    // (example : 126.45 hours = 1.0 5 days 1 hour and 27 minutes )
    public func convertAllInt(_ ms: Int=0,_ seconds: Float=0,_ minutes: Float=0,_ hours: Float=0,_ days: Float=0,_ months: Float=0,_ years: Float=0){
        self.ms = ms + Int(10e2*seconds+60*10e2*minutes+36*10e4*hours)
        self.ms += Int(36*10e4*24*days+36*10e4*24*28*months+36*10e4*24*28*12*years)
        self.minimiseLeft()
    }

    // return the difference between two dates (own and param date)
    // return something like : 3month(s) 14day(s) 41minute(s) 14second(s)
    public func diff(_ otherTimeToCompare:Time)->String{
        var ms : Int = 0
        var seconds : Int = 0
        var minutes : Int = 0
        var hours : Int = 0
        var days : Int = 0
        var months : Int = 0
        var years : Int = 0
        var res : String
        // can be strange if coder haven't minimized (left)
        // the self object and otherTimeToCompare object
        ms = otherTimeToCompare.ms - self.ms
        seconds = otherTimeToCompare.seconds - self.seconds
        minutes = otherTimeToCompare.minutes - self.minutes
        hours = otherTimeToCompare.hours - self.hours
        days = otherTimeToCompare.days - self.days
        months = otherTimeToCompare.months - self.months
        years = otherTimeToCompare.years - self.years
        res = "difference is : \(years)year(s)\(months)month(s)\(days)day(s)\(hours)hour(s)\(minutes)minute(s)\(seconds)second(s)\(ms)ms(s)"
        return res
    }
    // errors management
    private func errors(_ msg:String=""){
        print("ERROR : \(msg)")
        exit(0)
    }

    // display all help for class (and class usage)
    public static func help(){
        print("""
  class: Time
   inheritance : Date

    get help with : Time.help()
  
  +Time(ms : Int,seconds : Float,minutes : Float,hours : Float,days : Float,months : Float,years : Float)
      // build an object from Time class
  
  +Time(seconds : Int, minutes : Int, hours : Int)
      // build an object from Time class

  +Time()
      // create an object with now time data
  
  + convertMs()->Int
      // return time converted to MS

  + minimiseLeft()
      // convert all time units to do conversions into
      // all present units (from weak value to strong (ms->years))
      // example : 367 days = 1 year and 2 day

  - months2Days(_ months:Int)->Int{
      // convert month numbers into numbers of days
      // including different number of days for each months
      // including bissextiles years
              
  - days2Months(_ days:Int)->Int{
      // convert days into number of months
      // including different number of days for each months
      // including bissextiles years
  + getInString()->String
      // display time as string
      // format : 'xx:xx:xx jj/mm/yyyy'

  + bissextle(_ date:Int)->[Int]
      // return the list of bissextiles numbers between
      // year 0 and chosen date

  - getEpoch()
      // display time since epoch in seconds

  - getFirstDayNameOfYear()->Int
      // return a number between 0 and 6
      // of the day name indexes

  + getDayName()->String
    // return monday, friday etc..
    // from chosen date

  + getNow()->Time
      // return now time (seconds, minutes, hours)

  + getFullDate()->String
      // return date as : ss:mm:hh dd/mm/yyyy
      // format
            


  + getDate()->String
      // return date as : dd/mm/yyyy
      // format


  + convertAllInt(_ ms: Float=0,_ seconds: Float=0,_ minutes: Float=0,_ hours: Float=0,_ days: Float=0,_ months: Float=0,_ years: Float=0)
      // convert a float time
      // to int time

  + diff(_ date:Time)->string
      // display time between two dates
      // formatting as : Xmonth(s) Xday(s) Xminute(s) Xsecond(s)
      // where X represent te number of difference on each values

  - errors(_ msg:String='')
      // errors management

  + static help()
      // display this help
  
  """)
    }

}
