module RankingsHelper
	def classification
		Player.all.sort_by(&:points).reverse
	end
end
