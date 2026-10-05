package greeting

import "testing"

func TestGreet(t *testing.T) {
	got := Greet("Docker")
	want := "Hello, Docker!"
	if got != want {
		t.Errorf("Greet() = %q, want %q", got, want)
	}
}

func TestSumRange(t *testing.T) {
	got := SumRange(1, 10)
	want := 55
	if got != want {
		t.Errorf("SumRange(1, 10) = %d, want %d", got, want)
	}
}
