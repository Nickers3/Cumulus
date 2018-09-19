/*
    Copyright (c) 2018, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @author Salesforce.org
* @date 2018
* @group Utilities
* @description Unit tests for UTIL_String class
*
*/
@isTest(IsParallel=true)
private with sharing class UTIL_String_TEST {
    private static final String mixedCharacterString = 'Abc0123456789!@#$%^&*()_+[{]}|;:,<.>/?';
    
    /*******************************************************************************************************************
    * @description Verifies that only numeric characters are returned after processing the string
    */
    @isTest private static void nonNumericCharactersShouldBeRemoved() {
        String expectedValue = '0123456789';
        String actualValue = UTIL_String.numericCharactersOnly(mixedCharacterString);
        System.assertEquals(expectedValue, actualValue); 
    }

    /*******************************************************************************************************************
    * @description Verifies that only english language characters are returned after processing the string
    */
    @isTest private static void nonEnglishAlphabetCharactersShouldBeRemoved() {
        String expectedValue = 'Abc';
        String actualValue = UTIL_String.englishAlphabetOnly(mixedCharacterString);
        System.assertEquals(expectedValue, actualValue); 
    }

    /*******************************************************************************************************************
    * @description Verifies that only english language or numeric characters are returned after processing the string
    */
    @isTest private static void nonEnglishAlphabetAndNonNumericCharactersShouldBeRemoved() {
        String expectedValue = 'Abc0123456789';
        String actualValue = UTIL_String.EnglishAlphabetOrNumericOnly(mixedCharacterString);
        System.assertEquals(expectedValue, actualValue); 
    }

    /*******************************************************************************************************************
    * @description Verifies that null strings passed into string methods return null values
    */
    @isTest private static void nullStringsShouldReturnNull() {
        String nullTarget = null;
        System.assertEquals(null, UTIL_String.englishAlphabetOnly(nullTarget)); 
        System.assertEquals(null, UTIL_String.numericCharactersOnly(nullTarget)); 
        System.assertEquals(null, UTIL_String.englishAlphabetOrNumericOnly(nullTarget)); 
    }

}